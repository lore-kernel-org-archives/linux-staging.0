Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED2E70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 14:04:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03C5E619CB;
	Fri, 26 Mar 2021 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616767450;
	bh=Zs2rRN47kRjFlUlkrsivkHNzWjtW0HmD4GjZBzD8oYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqrbYJR6wyebGtF7bZOtzOV3QxrD/VyuQcWiZouuRzvxZmzgguWi5JRS5A6MTMecO
	 7wSnwzB5Gz4lvwZ81+LB22nCMSy9rG5g+aHTr9GOwGSXrrP8SRMdbeiutp4k+sPynJ
	 oaSryBTZz7zs4WCDxNBK0uLx7eVMogL+nL1oaNNQ=
Date: Fri, 26 Mar 2021 15:04:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/33] Staging: rtl8723bs: remove unnecessary enum names
 and definitions
Message-ID: <YF3p2ABUhzSxYRsP@kroah.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>

On Wed, Mar 24, 2021 at 01:44:23PM +0100, Marco Cesati wrote:
> The staging/rtl8723bs driver includes 82 enum definitions whose
> names are not referenced in the code. Furthermore, 57 enum definitions
> are useless, because the enum elements do not appear in the code.
> This patchset transforms 82 'named' enums in 'anonymous' enums and
> removes 57 enum definitions.
> 
> 
> [PATCH 01/33] Staging: rtl8723bs: remove named enums in rtw_mlme.h
> [PATCH 02/33] Staging: rtl8723bs: remove named enums in rtw_cmd.h
> [PATCH 03/33] Staging: rtl8723bs: remove named enums in rtw_eeprom.h
> [PATCH 04/33] Staging: rtl8723bs: remove named enums in hal_com.h
> [PATCH 05/33] Staging: rtl8723bs: remove named enums in rtw_recv.h
> [PATCH 06/33] Staging: rtl8723bs: remove named enums in drv_types.h
> [PATCH 07/33] Staging: rtl8723bs: remove named enums in rtw_ht.h
> [PATCH 08/33] Staging: rtl8723bs: remove named enums in wlan_bssdef.h
> [PATCH 09/33] Staging: rtl8723bs: remove named enums in rtw_mp.h
> [PATCH 10/33] Staging: rtl8723bs: remove named enums in osdep_service.h
> [PATCH 11/33] Staging: rtl8723bs: remove named enums in hal_intf.h
> [PATCH 12/33] Staging: rtl8723bs: remove named enums in rtw_pwrctrl.h
> [PATCH 13/33] Staging: rtl8723bs: remove named enums in rtl8723b_cmd.h
> [PATCH 14/33] Staging: rtl8723bs: remove named enums in hal_com_h2c.h
> [PATCH 15/33] Staging: rtl8723bs: remove named enums in rtw_wifi_regd.h
> [PATCH 16/33] Staging: rtl8723bs: remove named enums in wifi.h
> [PATCH 17/33] Staging: rtl8723bs: remove named enums in rtl8723b_hal.h
> [PATCH 18/33] Staging: rtl8723bs: remove named enums in hal_phy.h
> [PATCH 19/33] Staging: rtl8723bs: remove named enums in rtw_mlme_ext.h
> [PATCH 20/33] Staging: rtl8723bs: remove named enums in rtw_xmit.h
> [PATCH 21/33] Staging: rtl8723bs: remove named enums in rtw_rf.h
> [PATCH 22/33] Staging: rtl8723bs: remove named enums in HalPwrSeqCmd.h
> [PATCH 23/33] Staging: rtl8723bs: remove named enums in hal_com_phycfg.h
> [PATCH 24/33] Staging: rtl8723bs: remove named enums in ieee80211.h
> [PATCH 25/33] Staging: rtl8723bs: remove named enums in rtw_efuse.h
> [PATCH 26/33] Staging: rtl8723bs: remove named enums in odm_interface.h
> [PATCH 27/33] Staging: rtl8723bs: remove named enums in HalBtcOutSrc.h
> [PATCH 28/33] Staging: rtl8723bs: remove named enums in HalBtc8723b1Ant.h
> [PATCH 29/33] Staging: rtl8723bs: remove named enums in odm_types.h
> [PATCH 30/33] Staging: rtl8723bs: remove named enums in odm_DIG.h
> [PATCH 31/33] Staging: rtl8723bs: remove named enums in HalPhyRf.h
> [PATCH 32/33] Staging: rtl8723bs: remove named enums in odm.h
> [PATCH 33/33] Staging: rtl8723bs: remove named enums in HalBtc8723b2Ant.h

Was this a "v2" of the series?  Or does it not conflict with your other
series?

I'm getting confused...  Please check my tree and see what I have not
applied from you and resend...

thanks,
greg k-h
