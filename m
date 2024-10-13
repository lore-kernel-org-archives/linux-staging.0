Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8DD14A60A
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728851333; cv=none; b=Ww2s6jDp8bFI+yS6UIbkc34bJEfdDSmbS9lmo8kpZ0a223tLpjLz2QeDM5a6aVF7a5uTVXPozuDSP2E7G4//94qKn0UYAkMW/+BxPuJqcb4taB3wilWKEkSJTApPKLZYBbN7HO2ejLWS7u0zGOHw0TeEBqlOD9BaJQdW39s9kYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728851333; c=relaxed/simple;
	bh=B14erMBGVuq9kG+SORUOBD0xFZqGRijfqMUyrsc3wOA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=fLVqcYobBnEQnhkNSZNxSDSNcdAyHr8DiJd5BLWQC4eb7v8y4fcra1ABB/eGReo0YDGKhCHwBSDxCOfFSG29WnMfam2pS+F0XSIPL2gWttpemgFn04l8oINBxwDCwLKmDpkg6sqZSeiTpSzXxsUcoURhdvgEfyurk6jNg7iRrjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBHNrST+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBHNrST+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so53508766b.2
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 13:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728851330; x=1729456130; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wRWCdVZVlOXVVV3K+TnOo4abj1WCau4sw4RIKpf2YQ=;
        b=DBHNrST+3CoMk65PznVgGIupmmE2hU1DzkGpU6J8i3vYedANRuvWrS47k2JpgT3N9g
         fGInlJ/7MuIoqP1DXquRBPFTlN9AX88sXXXYCg2Rcx/snnGE42VgjSO7UVtp9Y3BJyZM
         Lu3EQ57FtJZOjZI9awOD3vFGAf9lq4TLuwNbNKZtVqoM5KFEMnuiz1glOSeE8yeKB71/
         3PuSI/4EuPo/lEtWrFBeKOu+Nvhx0ZQabga3qqF95/JTYKuoIRreFcFKQFqThDnF4zbR
         93OXCYI9EvnMkaz1QwuZinQ0MrvO6HobunrAnGKSuhugM0hWjFKY0Bx/SFVzB2vmfcet
         VBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728851330; x=1729456130;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wRWCdVZVlOXVVV3K+TnOo4abj1WCau4sw4RIKpf2YQ=;
        b=PvKMNtnfiMTJGTb45mn18tkt6Vygc4EisC73KcrR07NlhbNg0KhuJ4kub1mRoUa7lh
         XYOq/s8OdtlfHvxSiVHmJiaNF0nlLzAgRj0wg82uGyOzUglWSSv3KfinbKmfxQFm5Lv3
         PjhnEBniCLBiOOvPOYhJbIUxX7H/gDjMXnzrP9Ts6QhjRNxu5YGP2qE2zgS0tggUAGSq
         FneuYZt2vym158Hr4hw7u+KUdPQjLZUNj8LCyGujrxceo5GGs38js+aB515VS2wzKY/+
         QrBahEkx7ouadiZaAyvyo98W9WsFOiuqz4li76U2bRN2JFoi6eUvzQ7yDsYr7+mXbgSR
         H4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCW4UsXTxEM4abb7KM4N1gGlsILeRMReevL/SfLoEv34jml7QSB/VGMK2q1ebAapbBhqlrhaVYuXp+Qfk64Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzIWpR2+fhRzzY8mweAqKouiQFQk61bUvp7878FZ2jzWCJwaIRP
	NraCLLxqPytDlIRtIUiRs8hnVCmZklWd8sImgYBDaM7BL0b3ncN6
X-Google-Smtp-Source: AGHT+IFs8k6ARM1XBsiAlApkPDu0TO2sAvbk/FEu1+/7bODbqmT00VImgLMaitpFuy+TrqJfC18XtQ==
X-Received: by 2002:a17:907:86ab:b0:a99:f887:ec09 with SMTP id a640c23a62f3a-a99f887ee29mr376832566b.35.1728851330052;
        Sun, 13 Oct 2024 13:28:50 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a06169967sm114645266b.97.2024.10.13.13.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 13:28:49 -0700 (PDT)
Message-ID: <a7eb3db4-ad0d-451a-9106-90d481bd3231@gmail.com>
Date: Sun, 13 Oct 2024 22:28:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] ipw2100 ipw2200 ps3_gelic rtl8712 --- Are we ready for wext
 cleanup?
To: linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Geoff Levand
 <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Stanislaw Gruszka <stf_xl@wp.pl>,
 Gregory Greenman <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

origin of this question was the following patch series from Arnd Bergmann
[PATCH 00/10] Remove obsolete and orphaned wifi drivers
https://lore.kernel.org/linux-staging/20231023131953.2876682-1-arnd@kernel.org/

Here the remaining files that use iw_handler_def:
drivers/net/ethernet/toshiba/ps3_gelic_wireless.c:static const struct 
iw_handler_def gelic_wl_wext_handler_def = {
drivers/net/wireless/intel/ipw2x00/ipw2100.c:static const struct 
iw_handler_def ipw2100_wx_handler_def;
drivers/net/wireless/intel/ipw2x00/ipw2100.c:static const struct 
iw_handler_def ipw2100_wx_handler_def = {
drivers/net/wireless/intel/ipw2x00/ipw2200.c:static const struct 
iw_handler_def ipw_wx_handler_def = {
drivers/staging/rtl8712/os_intfs.c:     pnetdev->wireless_handlers = 
(struct iw_handler_def *)
drivers/staging/rtl8712/rtl871x_ioctl.h:extern struct iw_handler_def 
r871x_handlers_def;
drivers/staging/rtl8712/rtl871x_ioctl_linux.c:struct iw_handler_def 
r871x_handlers_def = {


In this Email Greg writes over rtl8192e:
https://lore.kernel.org/linux-staging/2024100810-payback-suds-8c15@gregkh/
"...
No staging driver should ever get in the way of api changes elsewhere in
the kernel, that's one of the rules of this part of the tree.  So from
my opinion, it's fine to delete it now.  It can always come back in a
new way later on.
..."

So it should not be an issue to remove rtl8712.

Stefan Lippers-Hollmann was one year ago still using the ipw2200.
https://lore.kernel.org/linux-staging/20231024014302.0a0b79b0@mir/

Here my opinion why I think we should reconsider this:

I really like to use old hardware. One of my computers is from trash and 
the other one is bought for 50€ three years ago. But non of my hardware 
is from before 2012. Do we as a community really need to support 
hardware from 2003 in kernel 6.13 for WLAN that evolved so rapidly? I do 
not think so.

People around me are complaining that the 2,4GHz WLAN is difficult to 
use because so many devices are using it. Such slow devices consume a 
lot of time to send and receive the data and block therefore other devices.

The longterm kernels will still support this hardware for years.

Please explain to our very high value resources (Maintainers, Developers 
with wext and mac80211 expierience) that you cannot find any other 
solution that is within technical possibility and budget (USB WLAN Stick 
or exchange of WLAN module) and that they need to invest their time for 
maintenance.
Here the example of invested time from Johannes Berg:
https://lore.kernel.org/all/20241007213525.8b2d52b60531.I6a27aaf30bded9a0977f07f47fba2bd31a3b3330@changeid/

I cannot ask the Linux kernel community to support my test hardware just 
because I bought it some time ago. Rather, I have to show that I use it 
for private or business purposes on a regular basis and that I cannot 
easily change.

Using this hardware is security wise not state of the art as WPA3 is not 
supported. We put so much effort into security. Why not here?

Thanks for your response.

Bye Philipp







