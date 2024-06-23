Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8ED184106
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165421; cv=none; b=RqeWyEXctbN2iJOjQcIKUTn/dvDiv154J4ZZO88Gaxq0ioPMP8I6TMslNbsKFeJOAu7p2iJ65aSUWCZqC4YvFpHVD8G+sZhJ3YmqQOngB+BbLhVjqN7HCfc8TRX/ogoDfmf0vU7acaTCHMzcWWgB6jF5xbTlhOppH/Kpj16i7ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165421; c=relaxed/simple;
	bh=ExoCJqTpMco12TXZTdMcBWBFpKtZp5Wcm0EG+hpigtU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSDCgcx0isHtIynoQblPpL4zEoxTgN+iGN6Tpa6RL9IGm1rJKNhguRaqZE1aSb3eQG9PoHfFhessVKbND85/JPha3UgfUq58cRLakBtTgBmroEpHJaFWKgpVGhRENM22xgi0xyzINGFq1a0abrrDlnM/jjaq40moid2ayNoyP3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEfyrS6S; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEfyrS6S"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57c74085d57so636283a12.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165418; x=1719770218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=djIlclWDul2OF8+tWR6DtUTqi1t0I4XJiTb+scEysCM=;
        b=AEfyrS6SB4MpzjtwlZIp0iM+r0Ul2HI9sfEFYc4MBNHvqqjXZTlosCRKm+ZkVN8CBI
         HYLNvcDp0CXqYE50bTyeqWOYzLAsoUGWsMHRXu4cjXpnUrVP983DNMq3nU5RQp46XDgO
         5ggJkeCfq2Rt2YL/nQAqQUzxI34VrdqlGQPn8tCGTRdyxylAbKFSL/oEhE8VTJqZj63q
         1G2/NtFy4uT1rA134vhnUFtmTWF4sJhK9bst3HJgIzPq5E3PURVXH01updaHEEeD1Tfy
         b9BYG39HrwwlxGECRSkZ+MO1RI8WirsZ2xSOx4ifQtB6XiXGGtHep631WOxbrkncIww+
         1sMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165418; x=1719770218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djIlclWDul2OF8+tWR6DtUTqi1t0I4XJiTb+scEysCM=;
        b=Fm5NXmlRXSRJ9O1cVfw60dr1ODD/6EFSRFiHxxyjEmTP5OKw1cZwzvg0ZwujQ15Api
         dZI3eiMsS0P0b7/ncaJAhkHQr76Wv8rxD3beL0f63wnXN5TRKZM5IMQfz3Qc9IEHl9ba
         0H19UNuVVMgiE4aRaCYEWy9jVpDrSlHZdlJDMvFbl5vcj7ziQKmBL+PsqZPOrVnuFyri
         rb32AHhinJLL82sqTE5Ff/f6cghlq/VI3DxRqEsy2UAQ+9nJraQhNgfh75PFtSmrZM/U
         lBIemlQ07JCemIzemEQYkfMJu6VCeXlkrcorSeZbpDLOcbjDEjRYr8fmHrqSNgV8KxuR
         V6CA==
X-Forwarded-Encrypted: i=1; AJvYcCWWJcOqEoDXe93bARdKZuG88ZqIxNv7tvmBCln2k1538NB1B0foHWfz6P+hMrcUzSzPCCNV6XHLCuO1dhl9XbUUWasCudVzZprQZkVtUw==
X-Gm-Message-State: AOJu0YzFJFfE6TTRY1OGyA2epEICEMv4LghofE9D1wIaMtLkzBstZSGW
	MeDgo1wB8lIkqMr1zpYY7GbM2ANZfE6L1hj46FT3PD1mZe7HGcegXLTJDw==
X-Google-Smtp-Source: AGHT+IGO1NegMuAyrjbF7I54mk1qrVBtQ9O5ZGBQwD1ddMx6OB0srVIgAQF7GFLq0qY30lmHtnxSHQ==
X-Received: by 2002:a17:906:2a14:b0:a6f:bbfd:39d1 with SMTP id a640c23a62f3a-a6fe087be90mr271154466b.2.1719165418208;
        Sun, 23 Jun 2024 10:56:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724adc5dd4sm88899266b.129.2024.06.23.10.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:56:57 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:56:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] staging: rtl8723bs: Remove switch(type) as type is
 constant
Message-ID: <1e3982de9a03e75931bf7977fca83c5402084aa4.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove switch(type) as type is constant and never matches any of the
cases.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 3fe27ee75b47..82722897d6cc 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2549,7 +2549,6 @@ static int cfg80211_rtw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	bool ack = true;
 	u8 tx_ch = (u8)ieee80211_frequency_to_channel(chan->center_freq);
 	u8 category, action;
-	int type = (-1);
 	struct adapter *padapter;
 	struct rtw_wdev_priv *pwdev_priv;
 
@@ -2581,19 +2580,6 @@ static int cfg80211_rtw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 		tx_ret = _cfg80211_rtw_mgmt_tx(padapter, tx_ch, buf, len);
 	} while (dump_cnt < dump_limit && tx_ret != _SUCCESS);
 
-	switch (type) {
-	case P2P_GO_NEGO_CONF:
-		rtw_clear_scan_deny(padapter);
-		break;
-	case P2P_INVIT_RESP:
-		if (pwdev_priv->invit_info.flags & BIT(0) && pwdev_priv->invit_info.status == 0) {
-			rtw_set_scan_deny(padapter, 5000);
-			rtw_pwr_wakeup_ex(padapter, 5000);
-			rtw_clear_scan_deny(padapter);
-		}
-		break;
-	}
-
 cancel_ps_deny:
 	rtw_ps_deny_cancel(padapter, PS_DENY_MGNT_TX);
 exit:
-- 
2.45.2

