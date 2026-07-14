Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3312410D2D
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034892; cv=none; b=WnwnCc6XoElB1kXkkGfxmUoYPHfbH5krvaQSK0vsbUEA7S3RNzx7CF+NeJ/LCA8FyAdEHBlCE0ApbK6KLJd1nc4RkQb9mFi3+ovO3/CZtUxqF7kWIlErl6vly+wFesMdnH8WudGqY5XVjPXlvpPIR2AcAO21Bha1NvQDF4+tJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034892; c=relaxed/simple;
	bh=UCBel2zhiaYu5dFqjTEjCTrbnvjgUBDs+YAhKN4u8M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QoJkkfzF9w7iJRmiEEnB7rlTXEC+uQyFz8XdWGbIK3JYt+fSm4FaJPn45U3eRlZ7LsTfzdABbFgY4yYrabKHD3yzx6JGZyHGXp0kc6RXBtrZCND4DHhg0Eh1irkQH9HD7OYL50iOA6msl3mJTNBm/M804qdltln6b3EFMKrAWzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhKaSWUr; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhKaSWUr"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a38d83a480so554161eaf.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034881; x=1784639681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbwIZFBF8Iz6LqeeG2AP7ya8fzzPvitx0MG9ZNL5PZg=;
        b=ZhKaSWUrt1MnufZ9JIFqWTEw8DejMtrpRQh0mT4EDYT+4AR87prygBgmbCjY0qEhaY
         gXNt2TMERIngA0oQRauBkvbm9gEAarpk8erv1dCyfGPVXo9OK6rFYKo9zsum6f7luebd
         ZrrWOdV1gVCItxplZeRMYfw7H8THzgVjIoS7/HnXozN0t3lM29+k3+svzxkDb21COBho
         8APw837JR/Wb0uRszBcIbVvbgqFyb/Va1cSvSxVaw17oPH3syYwCwGh49/jRGcicI2U7
         y1d3b4qBwyNSwWN5KDM31N5AePsnu34avp44eA4hYRcEkK6/8chZ7divPsI0vdUr+Trk
         0aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034881; x=1784639681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbwIZFBF8Iz6LqeeG2AP7ya8fzzPvitx0MG9ZNL5PZg=;
        b=RVLcAQ52NmFytlh4LYIvZCVnCq0g86ZGRXesRse75vToOsTjSmRWm5uhTEfjv9tZUI
         qc2XZMzJm8bGnXbhtRTJWQguNJehH0lJTEsSEqKMe2uNC4Twuej8U8E4o7XQr8PVquHX
         xldtH6BwfGtzWKadgfQIwXIrs01RnM2x7Z2aw997T1d0yn6DMVS9cBotsy82KBWxMVdw
         sXWU5z8h2TwrXXN16hlDOC/ntrYjOUk9mhuI6GSNIUem0sG6tj8WRYr8MX3ZOnzF9ui7
         UhgbKhH+ODE5HkPGre1KKBEMHZvFF4A/LPrposoRvoMDiKruwLPCia1HU4nSM8expafZ
         vP7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9PveI4rOp84i1hMzdAXK/k4/Yt03yQlFtLU5w0Wh5uWW/vvplqMl6Dtq33uon+6mM4ka8on/Ma+5neJuzi@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc18Y/swO0sTcI3h/uyrJ/EXkB4zg44ncUpUqkPq1SgpSwb11X
	7nv3PBqjLNSjIbci01iIi6LNTST8Bgmm+wZNA82t7GpiaslH9uwk1ao8
X-Gm-Gg: AfdE7clEWAsqFIbFIGqmz+Zdx/yEVAESvWjcs4NqKL/s+7V8qeYAonFpp83ex/gZF45
	xDUuIUIF2e9XRjxYMpgzZW9G75n7Qr0L05CsHXhOk8uHLIy5nhAuWkwzkA9OS3uqS+nmrRynEfa
	gccGr6fXvTCbFHnUKXFTig23Qfw3QQKL/qmu/iO3jt0bUBglbqab9MZxUr66kb7GfHpNkTZlrYN
	68Yoyns97vuZZhiyhwjIukheezArDjI0bTNmGKyERgXSkSFpXhNdsuhC3IypQFip7UisX52mDLE
	rh5nFON6LcOx6aPKyGLHLZedcrr5DSGrd/k0tyK1szmqZpqH8bYVNJhU6PKCZDF3KH8XEvQOoV3
	zoyQo3E+ELV6YDy7mqFWSJI6KloXR1n3tJO7uLBQxUE44t3nfWWISpvLw9tn+5Trvb6hldu9PHc
	i8c1WaesUrFPBPz+qRP1b8UpnddH//ncyl
X-Received: by 2002:a05:6820:1523:b0:6a3:7d24:7b8e with SMTP id 006d021491bc7-6a39be98f17mr5777449eaf.26.1784034881466;
        Tue, 14 Jul 2026 06:14:41 -0700 (PDT)
Received: from ChatreeyT9-N100.localdomain ([122.35.120.240])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm8518384eaf.2.2026.07.14.06.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:14:40 -0700 (PDT)
From: teirua <qndkdrnl@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MinJea Kim <qndkdrnl@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix inverted HT40 secondary channel offset
Date: Tue, 14 Jul 2026 22:14:21 +0900
Message-ID: <20260714131421.3980-1-qndkdrnl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <alSVi8i-OB7Y51MW@stanley.mountain>
References: <alSVi8i-OB7Y51MW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: MinJea Kim <qndkdrnl@gmail.com>

rtw_get_chan_type() maps the driver's channel offset to nl80211 channel
types the wrong way around.

In this driver HAL_PRIME_CHNL_OFFSET_LOWER means the primary channel is
the lower 20 MHz half of the 40 MHz pair, i.e. the secondary channel is
above the primary one: rtw_get_center_ch() computes the center channel
as "channel + 2" for OFFSET_LOWER, and bwmode_update_check() sets
OFFSET_LOWER when the AP's HT operation IE announces SCA (secondary
channel above). In nl80211 terms that is NL80211_CHAN_HT40PLUS, not
HT40MINUS.

Because of the inversion, cfg80211_rtw_get_channel() reports an HT40+
association as HT40-. For an HT40+ AP on a low channel (e.g. channel 3)
the resulting chandef spans below the 2.4 GHz band edge and is invalid,
so the regulatory core tears the connection down 60 seconds
(REG_ENFORCE_GRACE_MS) after the AP's country IE triggers a regdomain
change: reg_check_chans_work() considers the reported chandef unusable
and calls cfg80211_leave(). The supplicant then reconnects, the country
IE changes the regdomain again, and the cycle repeats, causing a
disconnect/reconnect loop every ~65 seconds for as long as the link is
up.

Observed on a TECLAST X80 Power tablet (RTL8723BS) associated to an
HT40+ AP on channel 3 with a KR country IE; a kprobe trace showed
cfg80211_disconnect() being invoked from reg_check_chans_work(). With
the mapping fixed, "iw dev wlan0 info" reports the correct
"width: 40 MHz, center1: 2432 MHz" and the periodic disconnects stop.

Fixes: 5402cc178c5d ("staging: rtl8723bs: add get_channel cfg80211 implementation")
Cc: stable@vger.kernel.org
Assisted-by: Claude-Code:claude-fable-5 bpftrace
Signed-off-by: MinJea Kim <qndkdrnl@gmail.com>
---
v2: drop the comment at the use site; the explanation stays in the
    commit message (suggested by Dan Carpenter)

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 6a97afd..967cd1b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1957,7 +1957,7 @@ static u8 rtw_get_chan_type(struct adapter *adapter)
 		else
 			return NL80211_CHAN_NO_HT;
 	case CHANNEL_WIDTH_40:
-		if (mlme_ext->cur_ch_offset == HAL_PRIME_CHNL_OFFSET_UPPER)
+		if (mlme_ext->cur_ch_offset == HAL_PRIME_CHNL_OFFSET_LOWER)
 			return NL80211_CHAN_HT40PLUS;
 		else
 			return NL80211_CHAN_HT40MINUS;
-- 
2.43.0

