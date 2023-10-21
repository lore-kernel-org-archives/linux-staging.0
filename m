Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8EAD532
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iErNxADe"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-507cee17b00so2383093e87.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697883307; x=1698488107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlDFm1A0ZxnZFxu7liRZfTzTOUGufRMA62jY0m2ti70=;
        b=iErNxADefFIWWALH0pI+UmKYH4EibYmBDVNCeROcNlDQ1fXHTTNHKVCd+cNOJN+ySm
         y5hqU9pV3JQzrD+ZlQ51e7or9WWJGn8Q3j+kn/yT0C5tb2wX5KQQcLQDWNMOam/xtbYq
         IHAbku3FLUDnPYC+OR5g1Grn+EXxEyQtB4RbyRfvg57sTTHgS63gGjdRNrADWnbgBNss
         WnwvY9qIJZiGjVxcj/VHxc2JLJQn0Q2cGF6sH5CuM6XMt+Oz1y1GpfhWrIytA5CUoNQ2
         1MFdkgrSphfOHVaqB6xT/EApx9oLUK74wb4hfWEeb90e+DoBmGrxtQ0L37OkR6zZkrzQ
         xbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697883307; x=1698488107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlDFm1A0ZxnZFxu7liRZfTzTOUGufRMA62jY0m2ti70=;
        b=sFefMH4NRLZGKw40zmxj1Naepy3kJiB2W0cfgqz/lEsULqKLIw4UFSeMXHk1gh45UK
         ouLMIZ3dDWNVPLQiGqb5diVmWPY5ORTNp/UxXP2U1fDYFbc0waaCNBaT2QLPMjup8rfc
         hPfgnpb1RDcO/Z6YK0WwSlGfj/BPnwB1Ii4rWfW6UMiR1s26Z/gYfn3ZENYNJe8EPLuh
         g7yfriIN8EasVa5arwWiCBfZKgCBvvebUHHEdgrvizJ+1C71C3Y/YuqdgaSK6Hdm0Sw2
         q7rkcClXoYU/Astlj4QhQELqV4hiozU2+ZDOMyFsC43kTH1dsCsVQAjIQUewrGQpt2JS
         HuLg==
X-Gm-Message-State: AOJu0Yzd+3HLQ8hxmUMRt+bljD1DDnSZ2cSJz0OGInqdztaNIuayl6Ni
	FCodMf6xmGWIVSX47bTGZAwuB1vlJto=
X-Google-Smtp-Source: AGHT+IGllfT3vKhWR+EL0kgG+v845jM1KXqcbLEVCj1CC59eCE2TaxI7oIKfUiAmgfxy6u3DETRb7Q==
X-Received: by 2002:a05:6512:20d3:b0:503:74c:9446 with SMTP id u19-20020a05651220d300b00503074c9446mr3044220lfr.24.1697883307412;
        Sat, 21 Oct 2023 03:15:07 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056512369200b005007e7211f7sm803114lfs.21.2023.10.21.03.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 03:15:05 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v3 5/7] staging: octeon: Fix introduction of new typedef cvmx_pko_status_t in octeon
Date: Sat, 21 Oct 2023 12:12:36 +0200
Message-Id: <20231021101238.81466-6-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231021101238.81466-1-bergh.jonathan@gmail.com>
References: <20231021101238.81466-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes the introduction of a new enum typedef cvmx_pko_status_t
in the octeon driver and then fix implementations which used it.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
Changelog:                                                                 
v1 -> v2: Fix breaking change spread across multiple patches                
v2 -> v3: Break changes up into individual patches for each removed        
          typedef

 drivers/staging/octeon/octeon-stubs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 6c0196c1a9f6..529a75ad7c67 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -244,7 +244,7 @@ enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
 };
 
-typedef enum {
+enum cvmx_pko_status {
 	CVMX_PKO_SUCCESS,
 	CVMX_PKO_INVALID_PORT,
 	CVMX_PKO_INVALID_QUEUE,
@@ -252,7 +252,7 @@ typedef enum {
 	CVMX_PKO_NO_MEMORY,
 	CVMX_PKO_PORT_ALREADY_SETUP,
 	CVMX_PKO_CMD_QUEUE_INIT_ERROR
-} cvmx_pko_status_t;
+};
 
 enum cvmx_pow_tag_type {
 	CVMX_POW_TAG_TYPE_ORDERED   = 0L,
@@ -1384,7 +1384,7 @@ static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
 						enum cvmx_pko_lock use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(uint64_t port,
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(uint64_t port,
 		uint64_t queue, union cvmx_pko_command_word0 pko_command,
 		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
-- 
2.40.1

