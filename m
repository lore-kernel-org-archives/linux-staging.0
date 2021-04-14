Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F6E6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id g5so26115944ejx.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4LkuDSuZCeRTIGtCAkcVXWu4VDc+ULV5uOosc47/Tmg=;
        b=P15fGSnXNckSkKIyVxo0g/sPSsVvevF6yBw+ylRQtj0dmHNTjlGgdT9TtLQMftYYvy
         fwImnBnWj5iUI2JXTPqFcGw8b507ucuKJPDVOePeQp9asCSO4yTZk7hajkYQ+tBjl8om
         GLIvCs1NngWjH+2ZcACVJV0YzlnjW+KwccTfXm0EGSxd/jBzcMDyOd+j/XP0f6qCsL5q
         OcoaMqo0jpZIuUlT17CiDU+gkVbacFmrsTV9KV+5MYxfBqah1rpF5eMjxUWDpLtVLYN4
         dThDdoskOKXZPOOhOtSD1qzxhXb1/rmkATesbyKfhpNO7A1+ZM4srQ9sdmqOjgikKs56
         wW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LkuDSuZCeRTIGtCAkcVXWu4VDc+ULV5uOosc47/Tmg=;
        b=BRgz4dNxhwBePy5xYKl87P8YNyMvm5ip9UHyMKc9UVh1SGpLoQZqks7Et2FGBAjtfZ
         r2vY64BuMsQrlIzawL4X8h9rJFTIWosokcHqSnmjginF7olduEbQzOmgxFHw7C+aBMy3
         uZcnZ8V7BKEo6/1NiGm2LrJVyK1nyLo/znS3A00rHbVh6SCgUKGSjVrjOx+pYS5DMBY4
         lQ9RYugW9g0mDAAnof9iGxDi8plIAWkPQC7JzSuMVsvlPSjmyx6lasEc9h7Q3XYWrnnQ
         iUBuozX7E6CoAwyvgjksFlf53Z9q2gKqwFksB6Jr5r17V4KiV+2GKbDg3/PGnDmoc3CN
         A91g==
X-Gm-Message-State: AOAM530xtUWfFIoc9EmH0SMgzBZ6cq9j03lWGc4ZClZODfU/mANMuhKm
	c7KxRvJtK4Tj/3ImZnsC2Tsalg==
X-Google-Smtp-Source: ABdhPJz3zAHUsIygjWtMfwxzjJMJogfor4zxk9C8GBAOPdRP5Ej1iWOH19gLeDM8n1i02RwNZprgbg==
X-Received: by 2002:a17:906:11d8:: with SMTP id o24mr155215eja.386.1618423924927;
        Wed, 14 Apr 2021 11:12:04 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:04 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@protonmail.com>,
	Andrey Shvetsov <andrey.shvetsov@k2l.de>,
	linux-staging@lists.linux.dev
Subject: [PATCH 29/57] staging: most: dim2: Provide missing descriptions and fix doc-rot
Date: Wed, 14 Apr 2021 19:11:01 +0100
Message-Id: <20210414181129.1628598-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Also demote merely half-complete header.

Fixes the following W=1 kernel build warning(s):

 drivers/staging/most/dim2/dim2.c:69: warning: Function parameter or member 'name' not described in 'hdm_channel'
 drivers/staging/most/dim2/dim2.c:69: warning: Function parameter or member 'reset_dbr_size' not described in 'hdm_channel'
 drivers/staging/most/dim2/dim2.c:104: warning: Function parameter or member 'dev' not described in 'dim2_hdm'
 drivers/staging/most/dim2/dim2.c:104: warning: Function parameter or member 'name' not described in 'dim2_hdm'
 drivers/staging/most/dim2/dim2.c:104: warning: Function parameter or member 'clk_speed' not described in 'dim2_hdm'
 drivers/staging/most/dim2/dim2.c:104: warning: Function parameter or member 'clk' not described in 'dim2_hdm'
 drivers/staging/most/dim2/dim2.c:104: warning: Function parameter or member 'clk_pll' not described in 'dim2_hdm'
 drivers/staging/most/dim2/dim2.c:104: warning: Function parameter or member 'bus' not described in 'dim2_hdm'
 drivers/staging/most/dim2/dim2.c:104: warning: Function parameter or member 'on_netinfo' not described in 'dim2_hdm'
 drivers/staging/most/dim2/dim2.c:104: warning: Function parameter or member 'disable_platform' not described in 'dim2_hdm'
 drivers/staging/most/dim2/dim2.c:440: warning: Function parameter or member 'most_iface' not described in 'configure_channel'
 drivers/staging/most/dim2/dim2.c:440: warning: Function parameter or member 'ch_idx' not described in 'configure_channel'
 drivers/staging/most/dim2/dim2.c:440: warning: Function parameter or member 'ccfg' not described in 'configure_channel'
 drivers/staging/most/dim2/dim2.c:440: warning: Excess function parameter 'iface' description in 'configure_channel'
 drivers/staging/most/dim2/dim2.c:440: warning: Excess function parameter 'channel' description in 'configure_channel'
 drivers/staging/most/dim2/dim2.c:440: warning: Excess function parameter 'channel_config' description in 'configure_channel'
 drivers/staging/most/dim2/dim2.c:558: warning: Function parameter or member 'most_iface' not described in 'enqueue'
 drivers/staging/most/dim2/dim2.c:558: warning: Function parameter or member 'ch_idx' not described in 'enqueue'
 drivers/staging/most/dim2/dim2.c:558: warning: Excess function parameter 'iface' description in 'enqueue'
 drivers/staging/most/dim2/dim2.c:558: warning: Excess function parameter 'channel' description in 'enqueue'
 drivers/staging/most/dim2/dim2.c:591: warning: Function parameter or member 'most_iface' not described in 'request_netinfo'
 drivers/staging/most/dim2/dim2.c:591: warning: Function parameter or member 'ch_idx' not described in 'request_netinfo'
 drivers/staging/most/dim2/dim2.c:591: warning: Function parameter or member 'on_netinfo' not described in 'request_netinfo'
 drivers/staging/most/dim2/dim2.c:591: warning: Excess function parameter 'iface' description in 'request_netinfo'
 drivers/staging/most/dim2/dim2.c:591: warning: Excess function parameter 'channel_id' description in 'request_netinfo'
 drivers/staging/most/dim2/dim2.c:631: warning: Function parameter or member 'most_iface' not described in 'poison_channel'
 drivers/staging/most/dim2/dim2.c:631: warning: Function parameter or member 'ch_idx' not described in 'poison_channel'
 drivers/staging/most/dim2/dim2.c:631: warning: Excess function parameter 'iface' description in 'poison_channel'
 drivers/staging/most/dim2/dim2.c:631: warning: Excess function parameter 'channel_id' description in 'poison_channel'

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Nícolas F. R. A. Prado" <nfraprado@protonmail.com>
Cc: Andrey Shvetsov <andrey.shvetsov@k2l.de>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/most/dim2/dim2.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index b34e3c130f53f..093ef9a2b2919 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -50,8 +50,10 @@ static DECLARE_TASKLET_OLD(dim2_tasklet, dim2_tasklet_fn);
 
 /**
  * struct hdm_channel - private structure to keep channel specific data
+ * @name: channel name
  * @is_initialized: identifier to know whether the channel is initialized
  * @ch: HAL specific channel data
+ * @reset_dbr_size: reset DBR data buffer size
  * @pending_list: list to keep MBO's before starting transfer
  * @started_list: list to keep MBO's after starting transfer
  * @direction: channel direction (TX or RX)
@@ -68,7 +70,7 @@ struct hdm_channel {
 	enum most_channel_data_type data_type;
 };
 
-/**
+/*
  * struct dim2_hdm - private structure to keep interface specific data
  * @hch: an array of channel specific data
  * @most_iface: most interface structure
@@ -428,9 +430,9 @@ static void complete_all_mbos(struct list_head *head)
 
 /**
  * configure_channel - initialize a channel
- * @iface: interface the channel belongs to
- * @channel: channel to be configured
- * @channel_config: structure that holds the configuration information
+ * @most_iface: interface the channel belongs to
+ * @ch_idx: channel index to be configured
+ * @ccfg: structure that holds the configuration information
  *
  * Receives configuration information from mostcore and initialize
  * the corresponding channel. Return 0 on success, negative on failure.
@@ -546,8 +548,8 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 
 /**
  * enqueue - enqueue a buffer for data transfer
- * @iface: intended interface
- * @channel: ID of the channel the buffer is intended for
+ * @most_iface: intended interface
+ * @ch_idx: ID of the channel the buffer is intended for
  * @mbo: pointer to the buffer object
  *
  * Push the buffer into pending_list and try to transfer one buffer from
@@ -579,8 +581,9 @@ static int enqueue(struct most_interface *most_iface, int ch_idx,
 
 /**
  * request_netinfo - triggers retrieving of network info
- * @iface: pointer to the interface
- * @channel_id: corresponding channel ID
+ * @most_iface: pointer to the interface
+ * @ch_idx: corresponding channel ID
+ * @on_netinfo: call-back used to deliver network status to mostcore
  *
  * Send a command to INIC which triggers retrieving of network info by means of
  * "Message exchange over MDP/MEP". Return 0 on success, negative on failure.
@@ -621,8 +624,8 @@ static void request_netinfo(struct most_interface *most_iface, int ch_idx,
 
 /**
  * poison_channel - poison buffers of a channel
- * @iface: pointer to the interface the channel to be poisoned belongs to
- * @channel_id: corresponding channel ID
+ * @most_iface: pointer to the interface the channel to be poisoned belongs to
+ * @ch_idx: corresponding channel ID
  *
  * Destroy a channel and complete all the buffers in both started_list &
  * pending_list. Return 0 on success, negative on failure.
-- 
2.27.0

