Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039692D784;
	Tue, 17 Oct 2023 18:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6eT8KL7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507a80e2a86so1055086e87.1;
        Tue, 17 Oct 2023 11:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697565722; x=1698170522; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=faMsIPVgEsi38B8ugABdV0PePmMuwFh46wQeSoEie0k=;
        b=G6eT8KL7pwJh/tVaRLDtW+yJOEwBakVIL5pM+jO+UVzf/4EroqbxhF4t3lo68nqSTj
         zRvFIJNbKoFMnCcSJPcj7nezn4QXF+kp9vAKzQ5xeDhxItbvrzEOMwbVdl+0O3LseoZP
         6E/ZQKnm1t0MZQf7nOXJkHIZ+N/0PCgQx3pAKv86tQBoZgea4jEI68n6PJuQ2Uszc6nE
         ZAjYwUizCh4Oxu84xFtXOozWxM+iKSVa71rHsZEVhOqemL1WKjWhp45qff6mc1aN3q5I
         KPDpTNUvcnLpdQvDPXsaOwp0LIosyxzmI4sAIJRtDBn0jP1U9URWDllyID8BX77QOhKC
         ZIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697565722; x=1698170522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faMsIPVgEsi38B8ugABdV0PePmMuwFh46wQeSoEie0k=;
        b=Mx/rCfi4HxLEtu7ImiJm3GP1LCWll1d1n+4LBncVQFopj3V58No7xq6LV6W+xS+gUw
         oRipHWgqegy+ENCMKS6DZ1YX5ERJTOVvHgzMrOHaz/A1+sU+klI7jZY06zBLNMKtkSbI
         RKzC6+5t3Ao76XqkpjB1iwec7XGhVUQiYDccd3APGgFwpSB+jKyR7WBR7QM8jjDY78kw
         LU6btyqWSzf7BQuUlXh/nFmtnGKajCvmGbm5bzNACY5ZYcDIEnz99VzwLHAJMcRnHCSf
         hgM8jJILl4mo1VqsehlcI8Pqpxla/xb3qS2yQG5qq7at+9zsh9BKpVoVEAE6erLFbeZq
         851w==
X-Gm-Message-State: AOJu0YxZqo+PrHW1ym00sV6+tlLDHHcQir8uibtsm8mLL7sF/436UOl1
	ifNe6KVY7q/53HtWXkAFLex9ZlpLQRE=
X-Google-Smtp-Source: AGHT+IH1QSCIJPjzuJWDEsOHlsJ4V7qM9R63EKVudpwzixCUngsIDvDMEhOHCshRKlUIlAp1SJW0dw==
X-Received: by 2002:a17:907:3da2:b0:9c3:cefa:93c9 with SMTP id he34-20020a1709073da200b009c3cefa93c9mr2659171ejc.1.1697565700782;
        Tue, 17 Oct 2023 11:01:40 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id bm4-20020a170906c04400b009c46445fcc7sm212321ejb.33.2023.10.17.11.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 11:01:40 -0700 (PDT)
Message-ID: <fc5aca64-d3c1-46f9-bcff-1f9bd5c6fc41@gmail.com>
Date: Tue, 17 Oct 2023 20:01:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Rename variable bUpdateBBVGA, byCurrentCh, byCurPwr
 and byBBPreEDRSSI
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Gilbert Adikankwu <gilbertadikankwu@gmail.com>,
 forest@alittletooquiet.net, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1697495597.git.gilbertadikankwu@gmail.com>
 <0f6661a4-7281-4d26-8c26-ba03a567fcaa@gmail.com>
 <2023101747-goal-curing-5577@gregkh>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <2023101747-goal-curing-5577@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/23 15:40, Greg KH wrote:
> On Tue, Oct 17, 2023 at 08:19:49AM +0200, Philipp Hortmann wrote:
>> On 10/17/23 00:58, Gilbert Adikankwu wrote:
>>> Make the variable names adhere to Linux kernel coding style and mute
>>> checkpatch.pl errors.
>>>
>>> Gilbert Adikankwu (4):
>>>     staging: vt6655: Rename variable bUpdateBBVGA
>>>     staging: vt6655: Rename variable byCurrentCh
>>>     staging: vt6655: Rename variable byCurPwr
>>>     staging: vt6655: Rename variable byBBPreEDRSSI
>>>
>>>    drivers/staging/vt6655/baseband.c    |  2 +-
>>>    drivers/staging/vt6655/channel.c     | 18 +++++++++---------
>>>    drivers/staging/vt6655/device.h      |  8 ++++----
>>>    drivers/staging/vt6655/device_main.c |  8 ++++----
>>>    drivers/staging/vt6655/dpc.c         |  2 +-
>>>    drivers/staging/vt6655/rf.c          |  4 ++--
>>>    6 files changed, 21 insertions(+), 21 deletions(-)
>>>
>>
>> Hi,
>>
>> -       if (priv->byCurrentCh == ch->hw_value)
>> +       if (priv->current_ch == ch->hw_value)^M
>>                  return ret;
>>
>> ERROR: DOS line endings
>>
>> What does the "^M" at the end of the new line?
>> Did you run checkpatch on your patches?
> 
> I don't see that on my side, are you sure this is there?
> 
> thanks,
> 
> greg k-h


Hi,

as previously assumed: yes I saved the email from Thunderbird to Downloads:

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git apply 
--reject --ignore-space-change --ignore-whitespace ~/Downloads/\[PATCH\ 1*
Checking patch drivers/staging/vt6655/baseband.c...
Checking patch drivers/staging/vt6655/channel.c...
Checking patch drivers/staging/vt6655/device.h...
Checking patch drivers/staging/vt6655/device_main.c...
Applied patch drivers/staging/vt6655/baseband.c cleanly.
Applied patch drivers/staging/vt6655/channel.c cleanly.
Applied patch drivers/staging/vt6655/device.h cleanly.
Applied patch drivers/staging/vt6655/device_main.c cleanly.
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git diff
diff --git a/drivers/staging/vt6655/baseband.c 
b/drivers/staging/vt6655/baseband.c
index 7d47b266b87e..4fe7b6856c29 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2087,7 +2087,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
                 /* {{ RobertYu: 20050104 */
         } else {
                 /* No VGA Table now */
-               priv->bUpdateBBVGA = false;
+               priv->update_bbvga = false;^M
                 priv->bbvga[0] = 0x1C;
         }

diff --git a/drivers/staging/vt6655/channel.c 
b/drivers/staging/vt6655/channel.c
index 6ac7d470c041..0e1ca481f976 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -86,7 +86,7 @@ bool set_channel(struct vnt_private *priv, struct 
ieee80211_channel *ch)
                 return ret;

         /* Set VGA to max sensitivity */
-       if (priv->bUpdateBBVGA &&
+       if (priv->update_bbvga &&^M
             priv->bbvga_current != priv->bbvga[0]) {
                 priv->bbvga_current = priv->bbvga[0];

diff --git a/drivers/staging/vt6655/device.h 
b/drivers/staging/vt6655/device.h
index 68bfadacfa7c..7b8fb2aad08a 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -246,7 +246,7 @@ struct vnt_private {
         unsigned char byAutoFBCtrl;

         /* For Update BaseBand VGA Gain Offset */
-       bool bUpdateBBVGA;
+       bool update_bbvga;^M
         unsigned int    uBBVGADiffCount;
         unsigned char bbvga_new;
         unsigned char bbvga_current;
diff --git a/drivers/staging/vt6655/device_main.c 
b/drivers/staging/vt6655/device_main.c
index b08fcf7e6edc..dd6ac8a3cc29 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -179,7 +179,7 @@ device_set_options(struct vnt_private *priv)
         priv->byBBType = priv->opts.bbp_type;
         priv->byPacketType = priv->byBBType;
         priv->byAutoFBCtrl = AUTO_FB_0;
-       priv->bUpdateBBVGA = true;
+       priv->update_bbvga = true;^M
         priv->preamble_type = 0;

         pr_debug(" byShortRetryLimit= %d\n", (int)priv->byShortRetryLimit);
@@ -423,7 +423,7 @@ static void device_init_registers(struct vnt_private 
*priv)
         /* initialize BBP registers */
         bb_vt3253_init(priv);

-       if (priv->bUpdateBBVGA) {
+       if (priv->update_bbvga) {^M
                 priv->bbvga_current = priv->bbvga[0];
                 priv->bbvga_new = priv->bbvga_current;
                 bb_set_vga_gain_offset(priv, priv->bbvga[0]);
@@ -1040,7 +1040,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
         long dbm;
         int i;

-       if (!priv->bUpdateBBVGA)
+       if (!priv->update_bbvga)^M
                 return;

         if (priv->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git add .
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git commit 
-m "test"
WARNING: Missing commit description - Add an appropriate one

ERROR: DOS line endings
#16: FILE: drivers/staging/vt6655/baseband.c:2090:
+^I^Ipriv->update_bbvga = false;^M$

ERROR: DOS line endings
#29: FILE: drivers/staging/vt6655/channel.c:89:
+^Iif (priv->update_bbvga &&^M$

ERROR: DOS line endings
#42: FILE: drivers/staging/vt6655/device.h:249:
+^Ibool update_bbvga;^M$

ERROR: DOS line endings
#55: FILE: drivers/staging/vt6655/device_main.c:182:
+^Ipriv->update_bbvga = true;^M$

ERROR: DOS line endings
#64: FILE: drivers/staging/vt6655/device_main.c:426:
+^Iif (priv->update_bbvga) {^M$

ERROR: DOS line endings
#73: FILE: drivers/staging/vt6655/device_main.c:1043:
+^Iif (!priv->update_bbvga)^M$

ERROR: Missing Signed-off-by: line(s)

total: 7 errors, 1 warnings, 0 checks, 48 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

"[PATCH] test" has style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
[staging-testing 0e62bfff3764] test
  4 files changed, 6 insertions(+), 6 deletions(-)
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Other patch:
Same issue

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git diff
diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c 
b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index ec8edfecdb73..47c01979e91f 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -43,11 +43,11 @@ static u8 tx_ts_delete_ba(struct rtllib_device 
*ieee, struct tx_ts_record *pTxTs

  static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct 
rx_ts_record *ts)
  {
-       struct ba_record *pBa = &ts->rx_admitted_ba_record;
+       struct ba_record *ba = &ts->rx_admitted_ba_record;^M
         u8                      bSendDELBA = false;

-       if (pBa->b_valid) {
-               deactivate_ba_entry(ieee, pBa);
+       if (ba->b_valid) {^M
+               deactivate_ba_entry(ieee, ba);^M
                 bSendDELBA = true;
         }


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
downloaded from 
https://lore.kernel.org/linux-staging/4124e456-bad6-af50-8237-85efbba31076@inria.fr/T/#m1d8abbe97ebcba7afc5def6b318e608be22cb0d8
On right clik on Link "raw" -> "save link as..."

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git apply 
--reject --ignore-space-change --ignore-whitespace 
~/Downloads/PATCH-2-4-staging-vt6655-Rename-variable-byCurrentCh.txt
Checking patch drivers/staging/vt6655/channel.c...
Checking patch drivers/staging/vt6655/device.h...
Applied patch drivers/staging/vt6655/channel.c cleanly.
Applied patch drivers/staging/vt6655/device.h cleanly.
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git diff
diff --git a/drivers/staging/vt6655/channel.c 
b/drivers/staging/vt6655/channel.c
index e90e0b43505d..13bc35bd2054 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -82,7 +82,7 @@ bool set_channel(struct vnt_private *priv, struct 
ieee80211_channel *ch)
  {
         bool ret = true;

-       if (priv->byCurrentCh == ch->hw_value)
+       if (priv->current_ch == ch->hw_value)
                 return ret;

         /* Set VGA to max sensitivity */
@@ -100,7 +100,7 @@ bool set_channel(struct vnt_private *priv, struct 
ieee80211_channel *ch)
          * it is for better TX throughput
          */

-       priv->byCurrentCh = ch->hw_value;
+       priv->current_ch = ch->hw_value;
         ret &= RFbSelectChannel(priv, priv->rf_type,
                                 ch->hw_value);

@@ -117,9 +117,9 @@ bool set_channel(struct vnt_private *priv, struct 
ieee80211_channel *ch)

                 /* set HW default power register */
                 VT6655_MAC_SELECT_PAGE1(priv->port_offset);
-               RFbSetPower(priv, RATE_1M, priv->byCurrentCh);
+               RFbSetPower(priv, RATE_1M, priv->current_ch);
                 iowrite8(priv->byCurPwr, priv->port_offset + 
MAC_REG_PWRCCK);
-               RFbSetPower(priv, RATE_6M, priv->byCurrentCh);
+               RFbSetPower(priv, RATE_6M, priv->current_ch);
                 iowrite8(priv->byCurPwr, priv->port_offset + 
MAC_REG_PWROFDM);
                 VT6655_MAC_SELECT_PAGE0(priv->port_offset);

@@ -127,9 +127,9 @@ bool set_channel(struct vnt_private *priv, struct 
ieee80211_channel *ch)
         }

         if (priv->byBBType == BB_TYPE_11B)
-               RFbSetPower(priv, RATE_1M, priv->byCurrentCh);
+               RFbSetPower(priv, RATE_1M, priv->current_ch);
         else
-               RFbSetPower(priv, RATE_6M, priv->byCurrentCh);
+               RFbSetPower(priv, RATE_6M, priv->current_ch);

         return ret;
  }
diff --git a/drivers/staging/vt6655/device.h 
b/drivers/staging/vt6655/device.h
index 8c90539cc3d7..45fae21139af 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -239,7 +239,7 @@ struct vnt_private {
         bool bIsBeaconBufReadySet;
         unsigned int    cbBeaconBufReadySetCnt;
         bool bFixRate;
-       u16 byCurrentCh;
+       u16 current_ch;

         bool bAES;

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$



Sorry for the mess.

Bye Philipp


































