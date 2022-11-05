Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187B71C3E;
	Sat,  5 Nov 2022 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667639874; bh=0k2RDug5pc4MMcEKXtUnw0PsbvgIt8UOxeK2uEfmz9E=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Dd+ffkviOI/jjvvr4HnTPa7VHDLOdTTrtk9K9sZNAfAMfz8+6sn1QjpQ52BWgW33s
	 2ofxjaNRbCUBScWNF88n/3eTE40lmN2g1o+hTmQZ216cEwgLu4AdwIaddEG53tedsZ
	 eerHGFOoHrwZlx7IlKBnIK75JqtvMBME6W12cZW4=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sat,  5 Nov 2022 10:17:54 +0100 (CET)
X-EA-Auth: 9RfHMYBQjwb4jAhokwpBK9jYv1fu27jxvUIPXSECBuVtzpauyOqGG9ozB/p6vH40UB+G5W85WrSmMoEi0KUvfYHfWMDQ+JQk
Date: Sat, 5 Nov 2022 14:47:49 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Simplify underutilized 2D array
 to 1D array
Message-ID: <Y2YqPatklSEPx5EV@qemulion>
References: <cover.1667586648.git.drv@mailo.com>
 <4fb8d9783553d15a58e774d7137519d46e58ee3a.1667586648.git.drv@mailo.com>
 <Y2YghalNBdtaAQdr@kroah.com>
 <Y2YiXCCyH9zJssCX@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2YiXCCyH9zJssCX@qemulion>

On Sat, Nov 05, 2022 at 02:14:12PM +0530, Deepak R Varma wrote:
> On Sat, Nov 05, 2022 at 09:36:21AM +0100, Greg Kroah-Hartman wrote:
> > >
> > > diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
> > > index fe9782d2d4fd..e16a769850c5 100644
> > > --- a/drivers/staging/rtl8723bs/hal/odm.h
> > > +++ b/drivers/staging/rtl8723bs/hal/odm.h
> > > @@ -481,7 +481,7 @@ enum odm_type_alna_e { /* tag_ODM_TYPE_ALNA_Definition */
> > >
> > >  struct iqk_matrix_regs_setting { /* _IQK_MATRIX_REGS_SETTING */
> > >  	bool bIQKDone;
> > > -	s32 Value[3][IQK_Matrix_REG_NUM];
> > > +	s32 Value[IQK_Matrix_REG_NUM];
> >
> > This field is used to store values (as your above patch shows), but
> > where is it actually used?  Are you sure it is needed at all?
>
> Hi Greg,
> For this driver, the values are passed onto setIqkMatrix_8723B() as arguments
> and used inside this function. They are needed to be retained in the structure.

Hello Greg,
Upon further review of the structure, I observed that the member "bIQKDone" is
also not used anywhere in the code and it can be removed as well. That cleanup
will lead to replacing this entire structure by a simple one dimensional 'Value"
array.

Please suggest if I should make that change and send in a revision?

Thank you,
./drv

>
> Thank you,
> ./drv
>
>
> >
> > thanks,
> >
> > greg k-h
> >
>
>
>


