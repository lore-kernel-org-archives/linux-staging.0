Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9686D37
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id r9so32818695ejj.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x6swCV8MABma/kvfA/z+/vs0favPyInYA12FLnpeb1k=;
        b=WhRVGsNUs16A4SHOiwGJH3+VhlkVON+SOgYg3cYg0syXzQCGucwewKfv1PGEXfKKEO
         w4InHL525QL6qZVBwNmGhKvPnxh9VH4oB53Hhbxy+8t/r9iucwiudvAfQ3ybkVOex5Iv
         bLaEz1R0/fBJmh9IsFGrcMbuEyWlRBirdIDKdexFar7xYJO7QVDpcBKuhooHecpO8/+P
         arrEBUdyE29OBxlR74ZYiAS83nJudtCX/vCLUf5DlBPW0rYyP14EFOUVhlpImcRsVvNA
         iWb444J07PyZf+bZN/uJRW2QAD8iktXDanTOamYzJpvTWGcyZKmkjgGUYnqH8EKWad17
         AeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x6swCV8MABma/kvfA/z+/vs0favPyInYA12FLnpeb1k=;
        b=nBNP3SfSMlzx6OYHJvASUcoIsX5CdddKoSroWUYIYQ7eOlBWnqaSo6bZFdBHQ/8Srt
         HNIbSzst3fVMotKDGhRrqzRet6FL4YRYiJR7z/7/l6doCdkV0KykOmGUtN0tx8qrRac4
         /fEH18JeSLslkNDAXYjU4VRCRzbUJk8dKtAkRm2HoTzpVvvurhOPmt1sgtZJzgipLKBA
         fasJvvGvwBVKNK1R4g7nmZ8j+Dro757MAPfabgX3nR6VkypZ9wbXKHBUCLoqklxcNXwr
         3mb8lulOmRgjftifzMSiE6Q7MCDFJ1EJafla2B9EUc2MNlS4ZQDvx6gqASYOkb618KGi
         E9tA==
X-Gm-Message-State: AOAM530F5nwgGR8FP8V+4t4OoI+VTrghfb7QIIyPOoOfz/Pt39F1ga9c
	w79u9PkJv/wjpdpIuQs/IJYpAA==
X-Google-Smtp-Source: ABdhPJw1exYvLBm56CUU8hswEMeLLroWnY2pN9quMUAksqZb74fNwYQ0mHj77DYzXWeKUuwYY/WCFg==
X-Received: by 2002:a17:907:2d94:: with SMTP id gt20mr150708ejc.552.1618423929013;
        Wed, 14 Apr 2021 11:12:09 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Shvetsov <andrey.shvetsov@k2l.de>,
	linux-staging@lists.linux.dev
Subject: [PATCH 33/57] staging: most: i2c: Fix a little doc-rot
Date: Wed, 14 Apr 2021 19:11:05 +0100
Message-Id: <20210414181129.1628598-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/most/i2c/i2c.c:66: warning: Function parameter or member 'most_iface' not described in 'configure_channel'
 drivers/staging/most/i2c/i2c.c:66: warning: Function parameter or member 'ch_idx' not described in 'configure_channel'
 drivers/staging/most/i2c/i2c.c:66: warning: Excess function parameter 'iface' description in 'configure_channel'
 drivers/staging/most/i2c/i2c.c:66: warning: Excess function parameter 'channel' description in 'configure_channel'
 drivers/staging/most/i2c/i2c.c:121: warning: Function parameter or member 'most_iface' not described in 'enqueue'
 drivers/staging/most/i2c/i2c.c:121: warning: Function parameter or member 'ch_idx' not described in 'enqueue'
 drivers/staging/most/i2c/i2c.c:121: warning: Excess function parameter 'iface' description in 'enqueue'
 drivers/staging/most/i2c/i2c.c:121: warning: Excess function parameter 'channel' description in 'enqueue'
 drivers/staging/most/i2c/i2c.c:166: warning: Function parameter or member 'most_iface' not described in 'poison_channel'
 drivers/staging/most/i2c/i2c.c:166: warning: Function parameter or member 'ch_idx' not described in 'poison_channel'
 drivers/staging/most/i2c/i2c.c:166: warning: Excess function parameter 'iface' description in 'poison_channel'
 drivers/staging/most/i2c/i2c.c:166: warning: Excess function parameter 'channel_id' description in 'poison_channel'

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Shvetsov <andrey.shvetsov@k2l.de>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/most/i2c/i2c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/i2c/i2c.c b/drivers/staging/most/i2c/i2c.c
index 893a8babdb2f7..7042f10887bb6 100644
--- a/drivers/staging/most/i2c/i2c.c
+++ b/drivers/staging/most/i2c/i2c.c
@@ -51,8 +51,8 @@ static void pending_rx_work(struct work_struct *);
 
 /**
  * configure_channel - called from MOST core to configure a channel
- * @iface: interface the channel belongs to
- * @channel: channel to be configured
+ * @most_iface: interface the channel belongs to
+ * @ch_idx: channel to be configured
  * @channel_config: structure that holds the configuration information
  *
  * Return 0 on success, negative on failure.
@@ -107,8 +107,8 @@ static int configure_channel(struct most_interface *most_iface,
 
 /**
  * enqueue - called from MOST core to enqueue a buffer for data transfer
- * @iface: intended interface
- * @channel: ID of the channel the buffer is intended for
+ * @most_iface: intended interface
+ * @ch_idx: ID of the channel the buffer is intended for
  * @mbo: pointer to the buffer object
  *
  * Return 0 on success, negative on failure.
@@ -153,8 +153,8 @@ static int enqueue(struct most_interface *most_iface,
 
 /**
  * poison_channel - called from MOST core to poison buffers of a channel
- * @iface: pointer to the interface the channel to be poisoned belongs to
- * @channel_id: corresponding channel ID
+ * @most_iface: pointer to the interface the channel to be poisoned belongs to
+ * @ch_idx: corresponding channel ID
  *
  * Return 0 on success, negative on failure.
  *
-- 
2.27.0

