Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578CE2E825
	for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiKG0skW"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b9f8c9307dso1883723b6e.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 12:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703275446; x=1703880246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5DKwbg4XD2gV+sjQTXut6IiDwsF80T3W1JqgBXYfc8=;
        b=aiKG0skWWfLrFdeMi3m90HBi3GwKAoULGrBnfeq+LdKNsUeM/Tzco/8IsIOIquooo2
         L/umVruHn1n8ScN7QrJv1k3IQcgc8t/Sl5GUQgj1NhWIyeBwD+mhn+jI3RaMWnjM2UmM
         8Z1PQw7NtwXOJ9/D3bVjC8Aa12umDjYlz7Xd8bAUtIidJ1Xlpf9+GJACz/IqjpAJZqNh
         ShdtiuCoovCPGk2LXZi3hidj/+TDTyN67lHTYns5/lgCPlWRxB8g1yswXn+tsPb1fQiT
         gUrpCTgYI3lf7ocLcPwg06+HbvjKuS5XYd9S8adZCbgDQfi/X1s9/8HBAAQo8Xt/T18P
         qc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703275446; x=1703880246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5DKwbg4XD2gV+sjQTXut6IiDwsF80T3W1JqgBXYfc8=;
        b=dUtHvJpBJD1ZJezZjapng9KXtVwvulKKzLM8WguzzVZyHp78WONOV6paDbDVRR6VOW
         zlsCDYeFyh+6qaNb1YzhosCjTA/Uy6ld5HeUru875qY7Lxxz07eQ4eMDo5kmLgDRtDMN
         k+8TZ14BI/sQ0MhHjKNuqF+LYJ/ddCKsaUAnvmT43rdYLVPBKXlhHkw4mL13F5pchlSa
         yJP9q90GCR+YS/aNYlNzYDepMVW+lUHAOxTiqq8y+2wJYsTtpvKoMJriOAtMzVLIMlGz
         +KLLOGMeDc6KsgIV9FEnqmXCfybBRlAAJ6JMQbKRik6dlekbLpHu+CpbMa3Dk1XUr8OQ
         C9Zg==
X-Gm-Message-State: AOJu0YxaiGp8hVLz5UPATNOqD338phodJ0FWUaG1Ff/pNz38lThwiGbW
	yg0PIfKfE4pXYcz++r0W/q4=
X-Google-Smtp-Source: AGHT+IGI+TxAGisu6bOpbKbHegQHk0kyWT7zWdfFSEsiGmXu5WjJvdAC+X2rqKb9XwCMmp7IWwGZSQ==
X-Received: by 2002:a05:6358:2799:b0:174:d909:c8da with SMTP id l25-20020a056358279900b00174d909c8damr794152rwb.39.1703275446271;
        Fri, 22 Dec 2023 12:04:06 -0800 (PST)
Received: from ubuntu.. ([202.166.220.102])
        by smtp.gmail.com with ESMTPSA id fw2-20020a17090b128200b0028c2844d285sm160945pjb.49.2023.12.22.12.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 12:04:05 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
Date: Fri, 22 Dec 2023 20:03:50 +0000
Message-Id: <20231222200350.2024-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported a spelling error
in ia_css_acc_types.h as below:

'''
WARNING: 'cummulative' may be misspelled - perhaps 'cumulative'?
        u32 padding_size;       /** total cummulative of bytes added due to section alignment */
                                          ^^^^^^^^^^^
'''

This patch corrects a spelling error,
changing "cummulative" to "cumulative".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index d6e52b4971d6..ac6fb0eb990a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -84,7 +84,7 @@ struct ia_css_blob_info {
 		memory_offsets;  /** offset wrt hdr in bytes */
 	u32 prog_name_offset;  /** offset wrt hdr in bytes */
 	u32 size;			/** Size of blob */
-	u32 padding_size;	/** total cummulative of bytes added due to section alignment */
+	u32 padding_size;	/** total cumulative of bytes added due to section alignment */
 	u32 icache_source;	/** Position of icache in blob */
 	u32 icache_size;	/** Size of icache section */
 	u32 icache_padding;/** bytes added due to icache section alignment */
-- 
2.34.1

