Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9102F27
	for <linux-staging@lists.linux.dev>; Sat, 11 Feb 2023 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676129345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vnewwx5BEEx6q0ZK/xXbQu7RnpiAewRN9TE3zelH0io=;
	b=TMCi11nPGsD+aoXwgVIfJ9pcPSMLC/WILouncyvZsRdIifACoSNqmTwgzTnIjTqUuXgaDo
	0E/mHr2X5cb0g/Z4V6FUpH6qPjQBTADb6S5yxJf0Dcr9Gf0PRflfwPrlHIaABTyCBNPD/g
	MxO8YAKz0gAAXCet4TWMY9RsFMsfprA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-LModsysVOFC35yve2OYk3Q-1; Sat, 11 Feb 2023 10:29:03 -0500
X-MC-Unique: LModsysVOFC35yve2OYk3Q-1
Received: by mail-qk1-f198.google.com with SMTP id 130-20020a370588000000b0072fcbe20069so5177053qkf.22
        for <linux-staging@lists.linux.dev>; Sat, 11 Feb 2023 07:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnewwx5BEEx6q0ZK/xXbQu7RnpiAewRN9TE3zelH0io=;
        b=JEwsG42UFscoeLlQOLSCSB1Fop0Nh1xFicFSKril34551yAIavbpULiMFOzy+5GhE6
         CIP4pOvXO1ldT0wB1yGAZmOVTjnkX1NSMJpUT003a08FkVTK93++juuV1pVVjCfW58s4
         r+YAlfbF4ZIq+0IUu52JioT6U7N6K3MBpUv+uBn/HJm2a68g1SGbaM7naiSFzwwQLIB0
         7qR8AhoMUIL+SZXpU+Q5GnX7FZbylbvN7HDwDpolMUs9BWHeNtSLX4fvkwOsY8C5tGub
         lUv9zwmVDdFDb4WO94uG6LDiOz2n2tKR9kH78g+NMWCWojsOMogeRLyuhBWqbug8pO8O
         FuTg==
X-Gm-Message-State: AO0yUKXZrFbDNhhZ26Rg3U+I78bLUfPe5L7h0O7uo89y4v2v+t/9uNpC
	HZXxD8CzkQGX7QO5FrxEtGetyAwUgOXEwnWzrP0tOf9EqvO8oyDwG8eg2REZrT2X0lmzeEnucOZ
	tx9jEe1qZ78MdgUbwUgeqvzRUTw==
X-Received: by 2002:a05:6214:19ec:b0:56e:9cf7:770e with SMTP id q12-20020a05621419ec00b0056e9cf7770emr4878173qvc.38.1676129343068;
        Sat, 11 Feb 2023 07:29:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+laBPz4EUeiyMJzQAIrxTFZNbvmVxan4PQhSxa+Fh3lCfCJDceEIUr3+ynEqcHI9SLUJTjmA==
X-Received: by 2002:a05:6214:19ec:b0:56e:9cf7:770e with SMTP id q12-20020a05621419ec00b0056e9cf7770emr4878147qvc.38.1676129342855;
        Sat, 11 Feb 2023 07:29:02 -0800 (PST)
Received: from borg.redhat.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id 9-20020a05620a048900b006fec1c0754csm5830350qkr.87.2023.02.11.07.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:29:02 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	dragan.m.cvetic@gmail.com,
	wjsota@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] staging: rtl8192e: set dm_rx_path_sel_table storage-class-specifier to static
Date: Sat, 11 Feb 2023 07:28:56 -0800
Message-Id: <20230211152856.2129062-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

smatch reports
drivers/staging/rtl8192e/rtl8192e/rtl_dm.c:147:21:
  warning: symbol 'dm_rx_path_sel_table' was not declared. Should it be static?

dm_rx_path_sel_table is only used in rtl_dm.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index d8455b23e555..3bc5dabf2e2c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -144,7 +144,7 @@ const u8 dm_cck_tx_bb_gain_ch14[CCK_TX_BB_GAIN_TABLE_LEN][8] = {
 /*------------------------Define global variable-----------------------------*/
 struct dig_t dm_digtable;
 
-struct drx_path_sel dm_rx_path_sel_table;
+static struct drx_path_sel dm_rx_path_sel_table;
 /*------------------------Define global variable-----------------------------*/
 
 
-- 
2.26.3

