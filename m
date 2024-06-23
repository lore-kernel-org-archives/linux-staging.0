Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE66185097
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165456; cv=none; b=PfjsyEuOAAIh+OujoG8dmw9RJYSBLm+HMGpAqtF81Ax2rdNO8ZqerMUFLEp6sl/7Mr7g7Rw0hPc2c3SCELdXym7j/sJZBs8m1EC+BEbrfiTfn2w3sQCU62lVjyojA58+JCGUXxLvxlx2e6Hh1n4GIJPHc8UT52gt4JUtG69ifYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165456; c=relaxed/simple;
	bh=JNCF8MfXklHl4C6j05doES2fTMNQuKfQjswvfgk6bv8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhmbJnOZwwYGD9UM7gUxd+BE9JiKYergNnAWwXDX9mbjJZGPXdh9jqAv0wP1Q+dHFjKOgDDRT5mQK998Uv5f25+tNN2I0BFVuCQg4bvECoG2Fd0jk98B3tmRJLowcuourZWWFKzzqs21+w3H1wAC2nUiZ50yPeZSm6FfIpga638=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flfrhxLF; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flfrhxLF"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-579e1bf599aso469807a12.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165454; x=1719770254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FtAQurWfvbD0wQVfBx68aLTWozMUJQpP//xDOdNrogo=;
        b=flfrhxLFE61kt9Glvr17q3mWNfjfUpOM1lN1muQY0bIalTp3F0LXWBdXnsLpl9c9TQ
         JZl0tBdYBQ3tih68ZHg8dMASWqGnaOGwjoAjJHznrTvA151mheHDQ9yUuUKotg6ScEmk
         OWhjlT+lQpMB4u0siAEhJv95LRG4m8beT2D9+RPhPJ+igfCvbVB7HmfpKaXjmfwp5KHi
         FmkLPKt7+sF/bkZDv1kHL6cjGX3xUuhOfHKzeDh+Idz3oN7oznL7CyjdbyHKkoSgu7Et
         Z16ZrklKesMKlXQBZaVrVRWOYRDlpH51yuRhaoCmKBI2GY00T5zUEtz/RwnQxBLzQs9/
         0Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165454; x=1719770254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtAQurWfvbD0wQVfBx68aLTWozMUJQpP//xDOdNrogo=;
        b=K2ZMJd4TEDP8sqNgLd3pEH9vC8vxGiElh+E/t+DUi6q4DlGRKMsoTfL/d0PjFSI/li
         IEego/vtFLG3lInlBxMZyztKY9Gssb3vzuLw+ZPZaU/TJJqAf95z8+PPtiQAGsMPBa8S
         gPIpGztxZDsnRuw/u0Lr/GNkJzYkMFPBsGY6pNunNRsI+ADcTX0TEm0IKLEbJ552p4Lv
         LA9rglu4SkJKN3Q9LPPlRiRfMxvC3nlSbkNz7n33kugi3uTCslsYHGxk3WpjlVgt6vmE
         UodL/0QIQBkvXKFRO4YTCK32gaSoSsPifgouyLoy4iR4ntxneeD0H1cPKF6H3gLd+qWT
         6HJw==
X-Forwarded-Encrypted: i=1; AJvYcCXnlM2p/8FU0plDLymYeDT7gagUQLglv+EbrBpLxxJjGBIofm9XZj8dBHN9rZPesT9M54d9qEyhwOibX1Bih8wOt+t1TXg/168eIaZeCA==
X-Gm-Message-State: AOJu0YwEGzlgNhnqVDmr/gXwjoj7wr23LreYaWX0GdgkW+/w2+VIc7fw
	Zt8RwHvf8qat20kQM+wzAodIZpVgaLoT5ZDIbptdjFfODnAY+a2h7hW/7Q==
X-Google-Smtp-Source: AGHT+IFG1nYe6wO44yn+4v5OrjGlXFGCRgVcdrYkFwuVhWdHT24uMOdtejZu9+RRm5vYAcAbBQj+sQ==
X-Received: by 2002:a50:c346:0:b0:57d:1d4:9afc with SMTP id 4fb4d7f45d1cf-57d43a6cff5mr1878689a12.1.1719165453568;
        Sun, 23 Jun 2024 10:57:33 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d305616f5sm3741653a12.80.2024.06.23.10.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:57:33 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:57:31 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] staging: rtl8723bs: Remove unused macros in sta_info.h
Message-ID: <912fba119b3041c396bcb2ddf22219fa0025ee42.1719155208.git.philipp.g.hortmann@gmail.com>
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

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/sta_info.h | 44 --------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 1ea3fe22b99a..b3535fed3de7 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -222,53 +222,24 @@ struct sta_info {
 	+ sta->sta_stats.rx_ctrl_pkts \
 	+ sta->sta_stats.rx_data_pkts)
 
-#define sta_last_rx_pkts(sta) \
-	(sta->sta_stats.last_rx_mgnt_pkts \
-	+ sta->sta_stats.last_rx_ctrl_pkts \
-	+ sta->sta_stats.last_rx_data_pkts)
-
 #define sta_rx_data_pkts(sta) \
 	(sta->sta_stats.rx_data_pkts)
 
 #define sta_last_rx_data_pkts(sta) \
 	(sta->sta_stats.last_rx_data_pkts)
 
-#define sta_rx_mgnt_pkts(sta) \
-	(sta->sta_stats.rx_mgnt_pkts)
-
-#define sta_last_rx_mgnt_pkts(sta) \
-	(sta->sta_stats.last_rx_mgnt_pkts)
-
 #define sta_rx_beacon_pkts(sta) \
 	(sta->sta_stats.rx_beacon_pkts)
 
 #define sta_last_rx_beacon_pkts(sta) \
 	(sta->sta_stats.last_rx_beacon_pkts)
 
-#define sta_rx_probereq_pkts(sta) \
-	(sta->sta_stats.rx_probereq_pkts)
-
-#define sta_last_rx_probereq_pkts(sta) \
-	(sta->sta_stats.last_rx_probereq_pkts)
-
 #define sta_rx_probersp_pkts(sta) \
 	(sta->sta_stats.rx_probersp_pkts)
 
 #define sta_last_rx_probersp_pkts(sta) \
 	(sta->sta_stats.last_rx_probersp_pkts)
 
-#define sta_rx_probersp_bm_pkts(sta) \
-	(sta->sta_stats.rx_probersp_bm_pkts)
-
-#define sta_last_rx_probersp_bm_pkts(sta) \
-	(sta->sta_stats.last_rx_probersp_bm_pkts)
-
-#define sta_rx_probersp_uo_pkts(sta) \
-	(sta->sta_stats.rx_probersp_uo_pkts)
-
-#define sta_last_rx_probersp_uo_pkts(sta) \
-	(sta->sta_stats.last_rx_probersp_uo_pkts)
-
 #define sta_update_last_rx_pkts(sta) \
 	do { \
 		sta->sta_stats.last_rx_mgnt_pkts = sta->sta_stats.rx_mgnt_pkts; \
@@ -281,21 +252,6 @@ struct sta_info {
 		sta->sta_stats.last_rx_data_pkts = sta->sta_stats.rx_data_pkts; \
 	} while (0)
 
-#define STA_RX_PKTS_ARG(sta) \
-	sta->sta_stats.rx_mgnt_pkts \
-	, sta->sta_stats.rx_ctrl_pkts \
-	, sta->sta_stats.rx_data_pkts
-
-#define STA_LAST_RX_PKTS_ARG(sta) \
-	sta->sta_stats.last_rx_mgnt_pkts \
-	, sta->sta_stats.last_rx_ctrl_pkts \
-	, sta->sta_stats.last_rx_data_pkts
-
-#define STA_RX_PKTS_DIFF_ARG(sta) \
-	sta->sta_stats.rx_mgnt_pkts - sta->sta_stats.last_rx_mgnt_pkts \
-	, sta->sta_stats.rx_ctrl_pkts - sta->sta_stats.last_rx_ctrl_pkts \
-	, sta->sta_stats.rx_data_pkts - sta->sta_stats.last_rx_data_pkts
-
 #define STA_PKTS_FMT "(m:%llu, c:%llu, d:%llu)"
 
 struct	sta_priv {
-- 
2.45.2

