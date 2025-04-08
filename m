Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7388256C99
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151833; cv=none; b=tioVryKFoCVcEkwBgenr6jTMii0/1LLxwkQ7I1HjTyfChRXDyHcWD1cDElPCYxw7XjGBYJhKIHhLaqwq7j4e9g5+/mZO6HVtf7XiJZge11ZZJ8v/8V5I006mK8Ua+O2V0Vfnsf07PCDTjYAe23cepMOMKlADPYf9DaVjGsexKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151833; c=relaxed/simple;
	bh=X2KhSNYsB2/23tHVl1psd3ZQKbNsc1BjZp9JQ+vPiUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfEUbxVihmbic579Rvx+rvnfRzGp4jxUtgFSsQTFMLhTZzo3Y+yLG0qPseD0rMId9pkW4JgwmcVLZG3jO+aOuFGD9qp73OZ7ShaoUcDg0LTe8z9NYCYkj2ANmHVd5YISiVpVVLeZTS8SBHUqO+A9Mo8gS3YTErUT4JfXTuYLaRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=KMavWDkE; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="KMavWDkE"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736b350a22cso5460219b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151831; x=1744756631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KxdZYlQTl7PeDblUTMa5/yJKQsZIFffGHGPPKkxlHI=;
        b=KMavWDkEWkAcF9uNVr/i4q+kUlyIqAeoW3UDCgPKKr3KSF3jUK9lirkKPZ4LbsNcfD
         /joRlOSLqUm1oSitgMOQhAtk0q0JYZ2EeQ2QNqxHS04QnKoLj5lLz3WLTgP39QKlonMu
         tvwyZEisMxpQE3XgKKh6UYWgfTjuqa0EX3e24XmxL5brN1GdzaTWNhJiCQlGxJd+Qr0P
         0Hts7r9WmAAins2CJttYq7NSSLeQtziGAfgnz0iDwpNiAG5q+GokEXMWKhR3r/xiPBE3
         g0IASkgs6ECeyk20gNP4w01BXHqs1MANFkE2fe1KnFOUVLy8xu4nehbIkWmBeyffz0WF
         sgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151831; x=1744756631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KxdZYlQTl7PeDblUTMa5/yJKQsZIFffGHGPPKkxlHI=;
        b=OZTLjB6oysuq8nYE/viIjm70zYtKBMxCq4jzj8EpLVqfqg8kQ3r/KZUJRBI9QBSbnt
         zrSGBDbomd4ZMlVGWyXlQ1ZsbbN4zVvmwQaL/x8Oo5rP2Z5OV8PhbWsGvhOWJE8+9nvX
         tHQEymwfaVWz8vOUIPgFFLxECupcmf2BUi//Atf32nySzbCciLk3/7ttxtMIqORTMFZs
         ziBVrEYwB5X5f7QCJih4dki0flrp307l/1FZ5kneO+xyZ8bacXybV+luQipt5Gp4hNkc
         Zo+/7Q7ydw8zpidEz5QDxF/5u2HK7y0zGpUuu3m9aP2dnJjqLGty1PkoAS4FaM1pCnyj
         GK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1s2Lv8zcann/ABhgsgbrw6UX1l8fz14oABX3mcEGkkErpFJrpmkRu/WQJOZyvK1LH920PC0RIG2rVv3e7@lists.linux.dev
X-Gm-Message-State: AOJu0YxCqWxQEcTSy6i4NaV8hOefbRZLp6pGRbN3iB4tJ/nV/nyOMdnL
	u8PXSO7e7o63j7l/49UmEIvmMo6qJEl/y0CzBZiRgfl9Ag+2WTNClR6ynBMSjA==
X-Gm-Gg: ASbGncuiRAnI02RMjADt2lDYv1jzrfL9o/1q0cAiymWxZJj8Dit577WMuL1Bnjk4VQq
	ZaPQZS4LW4LN3eIFs+VJ5hgXWVnNZbBUJQkR5JLi0ttixkeUlseTVy8qkuNDP+gsdLNAgsppmmc
	uHKVsEhflT2rTXtl+x4kGWn4+3rPUdi3GZx5u701rfz50ZVtMUdM5jfXJbuIQRmqz3HMDVOsjfb
	HzD4I5ltSP3Hv6br3PN+/I6gG2pYBxtvf6Oq5Fj0JGFVhoKYFJezwP1sRDgSEeFImPERorMiUrP
	z55CAQp2+nIMIACYIbTdAxTZiWedY2zmyaoKKUBpPqCRVY0JnhG0jlM9UmVYF4ciVlMERPQhGol
	ku/EhjWyVSQ==
X-Google-Smtp-Source: AGHT+IELnbIS31LEPqBsQyZVs/Pf5TPwyZfntfuAq7loIQm+HN4BwTJihQ4iJwPvkxGmFogIT1uUNA==
X-Received: by 2002:a05:6a21:a34c:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-201591ce35emr970643637.20.1744151831029;
        Tue, 08 Apr 2025 15:37:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41af71sm7939275a12.75.2025.04.08.15.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:10 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 07/18] staging: gpib: eastwood: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:47 +0000
Message-ID: <20250408223659.187109-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 68f888a75edc..e1f8598e4e04 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -24,8 +24,10 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB Driver for Fluke cda devices");
 
-static int fluke_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config);
-static int fluke_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config);
+static int fluke_attach_holdoff_all(struct gpib_board *board,
+				    const struct gpib_board_config *config);
+static int fluke_attach_holdoff_end(struct gpib_board *board,
+				    const struct gpib_board_config *config);
 static void fluke_detach(struct gpib_board *board);
 static int fluke_config_dma(struct gpib_board *board, int output);
 static irqreturn_t fluke_gpib_internal_interrupt(struct gpib_board *board);
@@ -943,7 +945,7 @@ static bool gpib_dma_channel_filter(struct dma_chan *chan, void *filter_param)
 	return chan->chan_id == 0;
 }
 
-static int fluke_attach_impl(struct gpib_board *board, const gpib_board_config_t *config,
+static int fluke_attach_impl(struct gpib_board *board, const struct gpib_board_config *config,
 			     unsigned int handshake_mode)
 {
 	struct fluke_priv *e_priv;
@@ -1049,12 +1051,12 @@ static int fluke_attach_impl(struct gpib_board *board, const gpib_board_config_t
 	return fluke_init(e_priv, board, handshake_mode);
 }
 
-int fluke_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config)
+int fluke_attach_holdoff_all(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return fluke_attach_impl(board, config, HR_HLDA);
 }
 
-int fluke_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config)
+int fluke_attach_holdoff_end(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return fluke_attach_impl(board, config, HR_HLDE);
 }
-- 
2.43.0

