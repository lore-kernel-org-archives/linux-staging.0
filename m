Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6312E29A0;
	Wed,  2 Nov 2022 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667416783; bh=02jfJdHjiuApcBPXp0F07fIvSINqtaBx9AWZYbB7XE8=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=hgEzR+29U19ai+qxHZoDTmRRc7b1ODBfV4A4/hFv7l9dMgXy3kGNjK2C657uRZex8
	 axpGTU1rZY0T1EHYO5kgVyxMFub72dxCBVtp51wWlA+lZoLM0V3E4jkW18ouzC1TeL
	 iZVFiRVmKb61QsFMobcefCnMNrmFPVR8c89fxXsU=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Wed,  2 Nov 2022 20:19:43 +0100 (CET)
X-EA-Auth: KVRuk3vVw19iYkSAVFc2EHPsG3glS/xo9WfyoQLIUERx8jv4MXF3Cfcu5PkopOHEwCrhZYgrlx3dpuktkDgScAEXRJ4DUjst
Date: Thu, 3 Nov 2022 00:49:38 +0530
From: Deepak R Varma <drv@mailo.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Use flexible-array for one length
 array member
Message-ID: <Y2LCykj5Ntx7yHxu@qemulion>
References: <Y1vRivFfRD6VoBt/@ubunlion>
 <642519a2-664d-d837-983a-1d5bbc72a25e@gmail.com>
 <Y1vjKtM9druO2bSN@ubunlion>
 <Y1vqd/ij5WqcL3Qe@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1vqd/ij5WqcL3Qe@kadam>

On Fri, Oct 28, 2022 at 05:43:03PM +0300, Dan Carpenter wrote:
> On Fri, Oct 28, 2022 at 07:41:54PM +0530, Deepak R Varma wrote:
> > On Fri, Oct 28, 2022 at 05:03:25PM +0300, Pavel Skripkin wrote:
> > > Hi Deepak R,
> > >
> > > Deepak R Varma <drv@mailo.com> says:
> > > > Flexible-array member should be used instead of one or zero member to
> > > > meet the need for having a dynamically sized trailing elements in a
> > > > structure. Refer to links [1] and [2] for detailed guidance on this
> > > > suggestion.
> > > >
> > > > [1] https://en.wikipedia.org/wiki/Flexible_array_member
> > > > [2] https://www.kernel.org/doc/html/v5.16/process/deprecated.html#zero-length-and-one-element-arrays
> > > >
> > > > Issue identified using coccicheck.
> > > >
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > ---
> > > >   drivers/staging/r8188eu/include/odm.h         | 2 +-
> > > >   drivers/staging/r8188eu/include/wlan_bssdef.h | 6 +++---
> > > >   2 files changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
> > > > index 89b01dd614ba..e2a9de5b9323 100644
> > > > --- a/drivers/staging/r8188eu/include/odm.h
> > > > +++ b/drivers/staging/r8188eu/include/odm.h
> > > > @@ -166,7 +166,7 @@ struct odm_ra_info {
> > > >
> > > >   struct ijk_matrix_regs_set {
> > > >   	bool	bIQKDone;
> > > > -	s32	Value[1][IQK_Matrix_REG_NUM];
> > > > +	s32	Value[][IQK_Matrix_REG_NUM];
> > > >   };
> > > >
> > >
> > > you are changing the actual size of the struct. Wondering if you have tested
> > > this patch somehow
> >
> > Hello Pavel,
> > Thank you for reviewing the patch. I build the module post making the changes an
> > ensured that the build is successful. However, I am not sure how to check the
> > changes I am proposing. Could you please direct me to some information on how to
> > test patches? Is there some documentation generic/driver-specific that I can
> > refer to?
>
> You just have to look at every place where it is used and especially
> look at where it is allocated.  It is only used in one place:
>
> 	struct ijk_matrix_regs_set IQKMatrixRegSetting;
>
> But that is in the middle of a struct and generally it doesn't make
> sense to have a flex array in the middle of a struct.  So investigating
> further, we see that it really is a one element array:
>
> Do a grep:
>
> 	pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][1]);
>
> The first element is always zero.  So this patch introduces memory
> corruption.
>
> The code is messy and should be cleaned up, of course.

Hello Pavel and Dan,
I looked at the surround code and places where the proposed patch will have an
impact. As you rightly pointed out this array can't be treated as a flexible
array since it fits right in the middle of another struct.

I am wondering if ijk_matrix_regs_set (or IQKMatrixRegSetting) is a one element
array, why is it declared as a two dimensional array? Can this be a simple one
dimensional array instead? Is this the cleanup you are referring to when you say
"code is messy and should be cleaned up"?


Thank you,
./drv

>
> regards,
> dan carpenter
>


