Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21030258C;
	Tue, 29 Mar 2022 19:01:51 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso2075730wmz.4;
        Tue, 29 Mar 2022 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R3zMo+uDtp2l+2kaX1Lp74xR1gw/ziE5ozZsnq4hQ8k=;
        b=U+PDa1smVYwC3pwXcJQc790e48a0STXHiJ1Tob4ZhZoOp359ppRiQcIiaruJv4Wonw
         vtGz291Bq4w0J332K00NGOGkTfqExMDhH7mrTif2Ci+lxQZFI47qvSACcVIamsVQKuLs
         /UtkQTP3EyFjF9oFQg5iTDAgeqdbOKGJLcTHCfzi11U5u131O6A7BpsZ5uFkyOd4CkqB
         7W/jshZwoROJnQ/czND4bmqo018rQ5HtLCDsIFC3fWDbNX7e1rIpXsvlC/m0bxguZbNy
         hS0ex9YQURLG4ZwalU3bmxGgm7oOxduNVuQR/7GA9DXN8v5Li/sQ/9qlc+K9sMrWJOE/
         9UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R3zMo+uDtp2l+2kaX1Lp74xR1gw/ziE5ozZsnq4hQ8k=;
        b=uPdMrsVeM1892F9+rRuzp0tc0KGkz1zBbMsFyRtYWRZgnZebK0i/x8SA+vteeLNo3A
         J2A52IrrglT+85WIWcZvADsIFYUyNewmW6ZIxu/AIpGA4KcuDlT1Z/YPpD7P2LJg4BRA
         jKIVxGiGUZ+JAv3StIN7ed5MdliewQVrfBHCrmQH7ICyOVEB7XrcV5JH6+RQ7cUvT6aa
         MoclEKR1frJrKUoeJlGDSQIaU7sJh7yFm7X8Q4XnC13z0KE446B4voYLc85z+013J9zt
         C6WI3lkEK2r2Q7B3iqC69PryqCGIwWKfUNPl0XMrtA5SqbdJoar+AzDdIXKa6MyJqt9i
         DT1Q==
X-Gm-Message-State: AOAM531EBfdeh6f+jY8t6yT0drrDzFIrz1CXw7RiG4cXDG+v8V88h3xc
	bVc/rWt5NxfJkxeWx5RyB8xUgu2tZr2uvA==
X-Google-Smtp-Source: ABdhPJztfYohtHoyBbHivKC+K8e7yMSDnLaeZ2arGqm7/qRuJ+I4cwrg3KZKsxzzBqJCb9PiJYomfg==
X-Received: by 2002:a05:600c:1d26:b0:38e:2c97:6f19 with SMTP id l38-20020a05600c1d2600b0038e2c976f19mr916630wms.89.1648580509138;
        Tue, 29 Mar 2022 12:01:49 -0700 (PDT)
Received: from alaa-emad ([41.37.132.115])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c191000b0038ca3500494sm4884687wmq.27.2022.03.29.12.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 12:01:48 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH] media:av7110:av7110_av.c remove blank line
Date: Tue, 29 Mar 2022 21:01:33 +0200
Message-Id: <20220329190133.6243-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

according to checkpatch.pl results
"CHECK: Please don't use multiple blank lines"
after lines 73 and 78 ,I removed the blank lines

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/media/av7110/av7110_av.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 91f4866c7e59..1544f120e8b1 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -70,12 +70,10 @@
 #define PIECE_RATE	 0x40
 #define SEAM_SPLICE	 0x20
 
-
 static void p_to_t(u8 const *buf, long int length, u16 pid,
 		   u8 *counter, struct dvb_demux_feed *feed);
 static int write_ts_to_decoder(struct av7110 *av7110, int type, const u8 *buf, size_t len);
 
-
 int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *buf, size_t len)
 {
 	struct dvb_demux_feed *dvbdmxfeed = (struct dvb_demux_feed *) p2t->priv;
-- 
2.35.1

