Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A757F10FB
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 07:20:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-2ef1e98d6bfso847307f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 00:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681629628; x=1684221628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8k9nO2fKVUUnwg/PlGeQfjbj4jMnL8QuYn9ONfwhXe4=;
        b=sNI+KFfcbiffyf/EojEIoeeerwb5EobglE7DpjCOkmAa3g0CQ+eysVPTAHBhgG8ztK
         AxIpWSVoKAkW5WMzFvz2ERsWrlDub+4d8ut8NKFTwa4eqc3juDJuHWrxeZ4CjOl3NIUj
         NxTS8tFIPAbkL9gpf3/mKn5hqzLkZCiBl9TqJpUMXXO3Fty5Q+20iTS19A2EVWfx62hg
         MKIMOqqcYocgRxy0oNJqw3HheaHOJNiou7SNplPGqTGdjui/kHmxhnWlsXYhqNb0t0AZ
         TFG17W6y/pOz6lJPHzGGyaAUDDga50KIDSb0VI/3w12h74WCoj8b0Ur1tju4aK+GW04i
         gduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629628; x=1684221628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8k9nO2fKVUUnwg/PlGeQfjbj4jMnL8QuYn9ONfwhXe4=;
        b=F7A3oijjyXvHthKyavqYpwylp718BPaSk2kW7AbFW8jQ3zLVXF8THX9wGQDw5r1oci
         +/c2ysoyBkQIqZ0gt88eOBOlDyEvecNXRMbXELejvrzIHRkCaBnOxOAww+VAz1V5T6fW
         IYJeDprBu6MEa89WHlBWN5CtwReMU/q0llqKiK6DlexhPGLP3HEwNZQRoMJ6HQVT1seI
         srvha6bAWpIou3EfTHs91K7DUKeY4wE7FDS10NmD33i5swIvJGWP5nEVBAFFV8s5vDqr
         KH6txU5njuR4OrUgugQ9KWw83Y+DWiiptYnVV9oOe9H2xaWyRIVrB+EfODJLzn87bSUH
         jadw==
X-Gm-Message-State: AAQBX9fc9ME5dW91lr+j+0CKrxwekqRYrFzeUfKqXbBjS9iKTogAzCYm
	n80grXuNxruooPFxXgNoMDA=
X-Google-Smtp-Source: AKy350btAN4DW4CTH6qT6sz3xd8RKmz9VH32cpkb6NnPX0LeUxjcUaGl8ZGZzJGvd9Sq5U24p8uI9g==
X-Received: by 2002:a05:600c:1d11:b0:3f1:7138:91ee with SMTP id l17-20020a05600c1d1100b003f1713891eemr899513wms.2.1681629628131;
        Sun, 16 Apr 2023 00:20:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id f20-20020a1c6a14000000b003f17329f7f2sm291552wmc.38.2023.04.16.00.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 00:20:27 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:20:25 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] staging: rtl8192e: Remove unchanged variables
 bfsync_processing and more
Message-ID: <cb609f904d988febaa579526514586877b1dabf7.1681627603.git.philipp.g.hortmann@gmail.com>
References: <cover.1681627603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681627603.git.philipp.g.hortmann@gmail.com>

Remove unchanged variable bfsync_processing and
rfc_txpowertrackingindex_real to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 1 -
 3 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 88ff54173a1f..27040d1e3230 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -786,7 +786,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rtllib->short_slot = 1;
 	priv->promisc = (dev->flags & IFF_PROMISC) ? 1 : 0;
 	priv->bcck_in_ch14 = false;
-	priv->bfsync_processing  = false;
 	priv->cck_present_attn = 0;
 	priv->rfa_txpowertrackingindex = 0;
 	priv->rfc_txpowertrackingindex = 0;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index c97e315a9091..285dac32c074 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -357,7 +357,6 @@ struct r8192_priv {
 	u8		rfa_txpowertrackingindex_real;
 	u8		rfa_txpowertracking_default;
 	u8		rfc_txpowertrackingindex;
-	u8		rfc_txpowertrackingindex_real;
 	bool		btxpower_tracking;
 	bool		bcck_in_ch14;
 
@@ -376,7 +375,6 @@ struct r8192_priv {
 	bool		bcurrent_turbo_EDCA;
 	bool		bis_cur_rdlstate;
 
-	bool		bfsync_processing;
 	u32		rate_record;
 	u32		rate_count_diff_rec;
 	u32		continue_diff_count;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 43e335ab0733..56a8ec517c06 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -998,7 +998,6 @@ void rtl92e_dm_backup_state(struct net_device *dev)
 	u32 bit_mask = bMaskByte0;
 
 	priv->bswitch_fsync  = false;
-	priv->bfsync_processing = false;
 
 	if (dm_digtable.dig_algorithm == DIG_ALGO_BY_RSSI)
 		return;
-- 
2.40.0

