Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587065F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 16:19:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69992619CB;
	Fri, 26 Mar 2021 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616775582;
	bh=WF+ucDdAPNhUtqEBLSQV1ozH5rZnpAdqlpnYnsgJD2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPo8Gr2LVDltJXDUsBuSDMeDgQ5bJnqv+q0BsdENm3diT3LMd/oSw+LnIpr0NBLep
	 W0lKoLQer/E1sFTf6/ucT6awMKW+SyoSoub9EpuyurBAC6DSfYFVs/vnNxUJizQ/DT
	 ajtLu90J2tkgUnup8HbmdcrbD30spfV8P0PjGLu4=
Date: Fri, 26 Mar 2021 17:19:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/33] Staging: rtl8723bs: remove unnecessary enum names
 and definitions
Message-ID: <YF4Jm1KzSyi3KyIK@kroah.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
 <YF3p2ABUhzSxYRsP@kroah.com>
 <20210326153754.ndl4k3duxsn2qfz3@cesati.gmail.com>
 <20210326160902.GF1667@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326160902.GF1667@kadam>

On Fri, Mar 26, 2021 at 07:09:03PM +0300, Dan Carpenter wrote:
> On Fri, Mar 26, 2021 at 04:37:54PM +0100, Marco Cesati wrote:
> > On Fri, Mar 26, 2021 at 03:04:08PM +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Mar 24, 2021 at 01:44:23PM +0100, Marco Cesati wrote:
> > > > The staging/rtl8723bs driver includes 82 enum definitions whose
> > > > names are not referenced in the code. Furthermore, 57 enum definitions
> > > > are useless, because the enum elements do not appear in the code.
> > > > This patchset transforms 82 'named' enums in 'anonymous' enums and
> > > > removes 57 enum definitions.
> > > > 
> > > > 
> > > > [PATCH 01/33] Staging: rtl8723bs: remove named enums in rtw_mlme.h
> > > > [PATCH 02/33] Staging: rtl8723bs: remove named enums in rtw_cmd.h
> > > > [PATCH 03/33] Staging: rtl8723bs: remove named enums in rtw_eeprom.h
> > > > [PATCH 04/33] Staging: rtl8723bs: remove named enums in hal_com.h
> > > > [PATCH 05/33] Staging: rtl8723bs: remove named enums in rtw_recv.h
> > > > [PATCH 06/33] Staging: rtl8723bs: remove named enums in drv_types.h
> > > > [PATCH 07/33] Staging: rtl8723bs: remove named enums in rtw_ht.h
> > > > [PATCH 08/33] Staging: rtl8723bs: remove named enums in wlan_bssdef.h
> > > > [PATCH 09/33] Staging: rtl8723bs: remove named enums in rtw_mp.h
> > > > [PATCH 10/33] Staging: rtl8723bs: remove named enums in osdep_service.h
> > > > [PATCH 11/33] Staging: rtl8723bs: remove named enums in hal_intf.h
> > > > [PATCH 12/33] Staging: rtl8723bs: remove named enums in rtw_pwrctrl.h
> > > > [PATCH 13/33] Staging: rtl8723bs: remove named enums in rtl8723b_cmd.h
> > > > [PATCH 14/33] Staging: rtl8723bs: remove named enums in hal_com_h2c.h
> > > > [PATCH 15/33] Staging: rtl8723bs: remove named enums in rtw_wifi_regd.h
> > > > [PATCH 16/33] Staging: rtl8723bs: remove named enums in wifi.h
> > > > [PATCH 17/33] Staging: rtl8723bs: remove named enums in rtl8723b_hal.h
> > > > [PATCH 18/33] Staging: rtl8723bs: remove named enums in hal_phy.h
> > > > [PATCH 19/33] Staging: rtl8723bs: remove named enums in rtw_mlme_ext.h
> > > > [PATCH 20/33] Staging: rtl8723bs: remove named enums in rtw_xmit.h
> > > > [PATCH 21/33] Staging: rtl8723bs: remove named enums in rtw_rf.h
> > > > [PATCH 22/33] Staging: rtl8723bs: remove named enums in HalPwrSeqCmd.h
> > > > [PATCH 23/33] Staging: rtl8723bs: remove named enums in hal_com_phycfg.h
> > > > [PATCH 24/33] Staging: rtl8723bs: remove named enums in ieee80211.h
> > > > [PATCH 25/33] Staging: rtl8723bs: remove named enums in rtw_efuse.h
> > > > [PATCH 26/33] Staging: rtl8723bs: remove named enums in odm_interface.h
> > > > [PATCH 27/33] Staging: rtl8723bs: remove named enums in HalBtcOutSrc.h
> > > > [PATCH 28/33] Staging: rtl8723bs: remove named enums in HalBtc8723b1Ant.h
> > > > [PATCH 29/33] Staging: rtl8723bs: remove named enums in odm_types.h
> > > > [PATCH 30/33] Staging: rtl8723bs: remove named enums in odm_DIG.h
> > > > [PATCH 31/33] Staging: rtl8723bs: remove named enums in HalPhyRf.h
> > > > [PATCH 32/33] Staging: rtl8723bs: remove named enums in odm.h
> > > > [PATCH 33/33] Staging: rtl8723bs: remove named enums in HalBtc8723b2Ant.h
> > > 
> > > Was this a "v2" of the series?  Or does it not conflict with your other
> > > series?
> > > 
> > > I'm getting confused...  Please check my tree and see what I have not
> > > applied from you and resend...
> > > 
> > > thanks,
> > > greg k-h
> > 
> > This was the first, original patch set. However, I got a comment from
> > Dan Carpenter from which I inferred that transforming named enums like
> > "enum XXX { ... };" into anonymous enums like "enum { ...  };", when
> > "XXX" is not referenced elsewhere, was not desiderable. Therefore, I
> > submitted another version of the patch set ("[PATCH 00/21] Staging:
> > rtl8723bs: remove unreferenced enum definitions"), which just removes
> > the enums having no reference _at_all_ in the code. To be clear, the 
> > patch set ("remove unreferenced enums") removes a strict subset of the
> > enums touched by this patch set ("remove named enums").
> > 
> > This patch set ("remove named enums") has been properly applied to your
> > tree, so for me all is fine.  I guess the decision is up to you: do you
> > prefer to _not_ remove the useless enum names? In this case, this patch
> > set has to be reverted.
> 
> Forget about it.  I didn't really endorse removing the enum names
> because I thought they were harmless and had some documentation value.
> But the value was very minimal...  Let's not revert anything.  Let's
> just move forward.
> 
> You're over apologizing.  No one is upset with you if your patch doesn't
> apply.  Greg just deletes it and moves on.  No one invests any time into
> trying to figure out what happened.
> 
> Now that Greg has applied whatever can apply he has deleted all the rest
> of your patches.  Just rebase and resend.

Yup, nothing to worry about here, I took this patchset as it seemed
semi-sane and cleaned up the code.  Please rebase and resend your other
work as well and I will be glad to review them.

thanks,

greg k-h
