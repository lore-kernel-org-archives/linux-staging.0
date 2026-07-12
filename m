Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163DD3126C2
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 04:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829479; cv=none; b=Z6LOuQvI5JqtoJpdvIKzua+TAXZjV3AAmjWrQOMr/+Fp0kGvcUdb/ywhlqIsVlioHUZrTsM/5VyFKm0ubYpgY1soT8hvCl5hOjPmh8NtFYwPy2wEzkVi+Dlf0QZZG5Cvhy+KBmii2W7JY61vHhQ3bxXFUNIL0kgTCdr2QfG0EB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829479; c=relaxed/simple;
	bh=nwZTpXgP8MVi00sG8x1sckv5BNqKE1ZEPgFs58b94wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7HNk9DaoIEtT0c2CRpXy/zGXeQMJdTn229xSPzasGG5TOLk4JB3cxFXd9RdzfnEiM5r5YT1BbyBGaWFe297CP1s3kY+eQzIAeZCQ5R4acbXQkh+w3RAcYihZIvfqKW2+b6SLdEUxmrb+Le/9ErWZdyVtVJM6xpeAkQCgYegUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJ/hAn0k; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ/hAn0k"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so27662035ad.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 21:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783829477; x=1784434277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Ua0X8FikfiEo6q6nozi853UqZXRTepXxqADI3wGhfM=;
        b=HJ/hAn0k50tK+iWG0qi+8W1ApgXhvEBlWtXCA8XlTFq3MvFHYTW8UnhzR00OlhEUgE
         GadheK5r7vvoDAo6wt57/QZ+TFN8keQ2TeuzkuxRTpE1qDDp9KXFikv2iwRYwNRs7hFz
         orzVg5vR0XUeFFLLbvsGhIwpZNdPgn/N7xCnTgNL0p/GAf6EPJK14CkJLmCiEcvdijRN
         csIjrlxitGATwjdSusfnyNgKyZZj9pwkeEY+XE7c95WBEFmWdNOmFjC/HrjYNcrmn56P
         gUNPwgSpWc2BEFzsPj3PxN0vFIZY3Vz3kRnttWGi5NaSHHa9yJpCk32A/hGz2i2Qs/CZ
         fzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783829477; x=1784434277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ua0X8FikfiEo6q6nozi853UqZXRTepXxqADI3wGhfM=;
        b=VPuT48aWpwXF+R8Mt1X9d30EK3+U8or24gKDHHgeuJgAulsJ9JjjS4XTCzDvugKj9M
         OtDFfOcATui8/ivrAA0u8Q+ne3UgVGZbrzRqGQ5ac5fFPxVnVpMgxl9fI/b69FGuchOQ
         q1eUpxX4LaX6v3iU88uSFEBZIuTOmByMggRxGxGXwlneVHim2ATGYtLNqESY1227b8T0
         DJ58Y83uj3li2rfSmuwTCBfeXtgHXvwOVkwgXDyzvF+EV7WMHIHO5kA0if7skqaey1Ys
         PiA7eCzN09FowsTuwebB06qiqiHEPMUM6XOa/mGk8JTs5WwKia8QJxB/lmuY+oDowk4S
         IluA==
X-Gm-Message-State: AOJu0YyXx/Kk2WaXH4JRKdgXkBcrrgGZiw1m6w3V6keYxOjMbmEAcdeS
	DCtbvflCnKralJ03f9BfgOO53xmFfQ/eihWB/Tjse/Zwh2AaelgPJ2mM3ZPCz7O0+Kg=
X-Gm-Gg: AfdE7clCCcev0uZhPGNl6aVzR+3zToNomdxiuRJxLPpPF5uvkM6B7GQYeK6Xn+IQEmD
	hSSSt9/0RwSq7jhw+bSTkc27+5uQxK4y+HozFAsA8LnduvGrqXwSPl5hkqbHkP91YYNr8zP5loB
	/aUCC3toDClpH5+hwuQN9gysoCGe7hQMMYge4YLmEHtQhBnRni5ZdfncaHyzBLQ5gHZlo9CTGhx
	ezKMoyVrDDQuCz/j1Yxv292TwWmGpsMBSdlLuvTKNijAJDpWSVNkdvVLJpWy6e9Efuu2wCh177K
	KI21MtmN9PX8iQNQI0dkiCWzQ+aI/bwK2hKGDJKk+HqRzieePUMtgFpEJgQpnB06EMkt5imZ8aT
	BXL57UlKiXgKfeHD0u2V6FexRnfm8/w5VT096clszj69I0CmRDdujukOAp4b8sUgkkzU2ONPboM
	NJQC2XG6/ZAz7goY7HBPyOn8FpYZGFGkissJII8nVntaU=
X-Received: by 2002:a17:902:d2c8:b0:2c9:e835:ac67 with SMTP id d9443c01a7336-2ce9eacec40mr49101855ad.19.1783829477400;
        Sat, 11 Jul 2026 21:11:17 -0700 (PDT)
Received: from ChatreeyT9-N100.localdomain ([122.35.120.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce935d9696sm26358595ad.25.2026.07.11.21.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:11:16 -0700 (PDT)
From: teirua <qndkdrnl@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MinJea Kim <qndkdrnl@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix inverted HT40 secondary channel offset
Date: Sun, 12 Jul 2026 13:11:00 +0900
Message-ID: <20260712041100.11787-1-qndkdrnl@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1484336..e472687 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1949,7 +1949,12 @@ static u8 rtw_get_chan_type(struct adapter *adapter)
 		else
 			return NL80211_CHAN_NO_HT;
 	case CHANNEL_WIDTH_40:
-		if (mlme_ext->cur_ch_offset == HAL_PRIME_CHNL_OFFSET_UPPER)
+		/*
+		 * HAL_PRIME_CHNL_OFFSET_LOWER means the primary channel is
+		 * the lower 20 MHz half, i.e. the secondary channel sits
+		 * above it (SCA), which is NL80211_CHAN_HT40PLUS.
+		 */
+		if (mlme_ext->cur_ch_offset == HAL_PRIME_CHNL_OFFSET_LOWER)
 			return NL80211_CHAN_HT40PLUS;
 		else
 			return NL80211_CHAN_HT40MINUS;
-- 
2.43.0

