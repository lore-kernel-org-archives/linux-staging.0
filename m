Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C947470;
	Thu,  3 Nov 2022 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667485709; bh=O3gcKtZf3JN4CuRNiBO1TzUvJpxZA9FyLNzOpdUO0e8=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Sn2w9XNRxJ4mb0hmwBn9g/UvEaS9tqr3JXwVxgznaiU0LNslxUTlYXIfsXAQ0SYmc
	 gPSXuiPoABXanDYTLXG48Tc86Zdzn32FImQHeXndGFG3YABs/0Jb+l1i3Y7YdfvC5R
	 BCeEpx2qx7upkNq/Rkx1+7J1U73hArWW4UF9Sf3U=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Thu,  3 Nov 2022 15:28:29 +0100 (CET)
X-EA-Auth: tobr3w2tZkk+sF+cCRPw0M+wQHhaT8uOLU+Cut8PNFp0iduoGrOCx+jbOD889/iydI2k+kng2gN5+bIQhqIHeIJbGwbdynhR
Date: Thu, 3 Nov 2022 19:58:20 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: replace one element 2D array by 1D
 array
Message-ID: <Y2PQBAEvyRApFCcZ@qemulion>
References: <Y2OsUYcBYe1fZR1W@qemulion>
 <Y2PBsBEyeO4tTYy0@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2PBsBEyeO4tTYy0@kroah.com>

On Thu, Nov 03, 2022 at 10:27:12PM +0900, Greg Kroah-Hartman wrote:
> On Thu, Nov 03, 2022 at 05:26:01PM +0530, Deepak R Varma wrote:
> > A single element two dimensional array is constrained to index 0 for
> > that element. This constraint makes it similar to a one dimensional
> > array.  Hence convert such array to a simplified one dimensional
> > equivalent. Resultant code is simpler and easy to maintain.
> >
> > Suggested-by: Dan Carpenter <error27@gmail.com>
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 2 +-
> >  drivers/staging/r8188eu/include/odm.h        | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> > index 622f95d3f2ed..c0706c5b3fd8 100644
> > --- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> > +++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> > @@ -886,7 +886,7 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
> >  /* by sherry 20120321 */
> >  	if (final_candidate < 4) {
> >  		for (i = 0; i < IQK_Matrix_REG_NUM; i++)
> > -			dm_odm->RFCalibrateInfo.IQKMatrixRegSetting.Value[0][i] = result[final_candidate][i];
> > +			dm_odm->RFCalibrateInfo.IQKMatrixRegSetting.Value[i] = result[final_candidate][i];
>
> Why is this field only being set and never used?
>
> Is it even needed at all?  If not, why not just remove it entirely?

I looked through the code and indeed have not found this member being used
anywhere. I will send in a revision shortly.

Thank you.
./drv

>
> thanks,
>
> greg k-h


