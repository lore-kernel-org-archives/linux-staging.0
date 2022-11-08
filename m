Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028B8BE1;
	Tue,  8 Nov 2022 15:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82ABC433C1;
	Tue,  8 Nov 2022 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667920785;
	bh=9j6OpcZxpYvPNY46Jt6pWBXlFa6GYBImaZF6nnesoL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I6SYwvYaxqJaal9v+Q7NxjiqMnYGAbbG2uBqOobTmh4rVJ2SbVSjVX0RfgHuoF57U
	 jF7mTGmIRAhAI7z/FXn/aqgWrYDHIotdcjT66cToI1wBluS2+DbVDyYs/1cD3+gjQD
	 xRmUMNsSWv0TnKg8IEV19nFS69e4PYLlzH8wuacU=
Date: Tue, 8 Nov 2022 16:19:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Simplify underutilized 2D array
 to 1D array
Message-ID: <Y2pzjVVtBe04Zyna@kroah.com>
References: <cover.1667586648.git.drv@mailo.com>
 <4fb8d9783553d15a58e774d7137519d46e58ee3a.1667586648.git.drv@mailo.com>
 <Y2YghalNBdtaAQdr@kroah.com>
 <Y2YiXCCyH9zJssCX@qemulion>
 <Y2YqPatklSEPx5EV@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2YqPatklSEPx5EV@qemulion>

On Sat, Nov 05, 2022 at 02:47:49PM +0530, Deepak R Varma wrote:
> On Sat, Nov 05, 2022 at 02:14:12PM +0530, Deepak R Varma wrote:
> > On Sat, Nov 05, 2022 at 09:36:21AM +0100, Greg Kroah-Hartman wrote:
> > > >
> > > > diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
> > > > index fe9782d2d4fd..e16a769850c5 100644
> > > > --- a/drivers/staging/rtl8723bs/hal/odm.h
> > > > +++ b/drivers/staging/rtl8723bs/hal/odm.h
> > > > @@ -481,7 +481,7 @@ enum odm_type_alna_e { /* tag_ODM_TYPE_ALNA_Definition */
> > > >
> > > >  struct iqk_matrix_regs_setting { /* _IQK_MATRIX_REGS_SETTING */
> > > >  	bool bIQKDone;
> > > > -	s32 Value[3][IQK_Matrix_REG_NUM];
> > > > +	s32 Value[IQK_Matrix_REG_NUM];
> > >
> > > This field is used to store values (as your above patch shows), but
> > > where is it actually used?  Are you sure it is needed at all?
> >
> > Hi Greg,
> > For this driver, the values are passed onto setIqkMatrix_8723B() as arguments
> > and used inside this function. They are needed to be retained in the structure.
> 
> Hello Greg,
> Upon further review of the structure, I observed that the member "bIQKDone" is
> also not used anywhere in the code and it can be removed as well. That cleanup
> will lead to replacing this entire structure by a simple one dimensional 'Value"
> array.
> 
> Please suggest if I should make that change and send in a revision?

Yes, that would be a better overall change.

thanks,

greg k-h
