Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2D33C2
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 23:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648596344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j9WAFWoFaJCbtXRV2bAUg/ZVuSKeu2t11Zs3/Bjgv9o=;
	b=VEuQqwUvdjjx21mFKi/tmmDfGn7RRmWG3DYy4zxeH6qyauziYnoQXwxWjxSX0TZvrVG+Aj
	kOif0P/hB+tw6BPahdB2v02lJzlek0HDWr4uPZVTijmFS5uzn/1RwKckiDmxbDiCui32qg
	/ijxU+TUnXH4dmVaI+7mPax2WFQPT0Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-ATRxMbE4Nu6TNHtGOP6yRA-1; Tue, 29 Mar 2022 19:25:43 -0400
X-MC-Unique: ATRxMbE4Nu6TNHtGOP6yRA-1
Received: by mail-qt1-f197.google.com with SMTP id f3-20020ac84983000000b002e22396acfbso15988090qtq.18
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 16:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j9WAFWoFaJCbtXRV2bAUg/ZVuSKeu2t11Zs3/Bjgv9o=;
        b=GkVr5h7t0CcXRUpNuS3T8fYLtgBPlupoq6Lvkm21qY4+n/s1ZXZ0zTWSJGp3t309vt
         HWsRmNV0WON3axqw39Q/nrNbuyD379B1OotaFvD/pHOBbi4l145akTNoLwxOHL/JZPsd
         l5UGk0hLTZjieqYXEyYM9ISLAt7DPE3R6Npy7A3OYA9ya81RMGQ9wODKOc90FU3NP8Lk
         5Q/PCyaZFbBf2qw7lLUVl7NNikrx0DT0HTwFqt0eaAB5EmXz8b8SjrY9bfou/l2LxphS
         qeI+CfRa2PzJHy+UrRtyWXjYbs0gAJyvagrGPhZh6EJMkZIl5MUNwJVSaHJD2vICmcrr
         FrfQ==
X-Gm-Message-State: AOAM532BV1aSklbf/WeO+GUD7l6NfRs2Q9kXtUphj38raCtgKK/YnoC+
	grKLk3yuSalJj+w56nNpTPabPt2uz9GashrXxJMrDW1Kbw1b05u0z2vLZh3wOei9PxDdxfUhMbM
	v3sNMl/lBb3aTZQ/pym9cYwufqQ==
X-Received: by 2002:a05:620a:68a:b0:67b:3135:a9aa with SMTP id f10-20020a05620a068a00b0067b3135a9aamr22146765qkh.508.1648596342752;
        Tue, 29 Mar 2022 16:25:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOKNeFEhOkGB2fAKKllqYm87EkU8WRMQ94OOyRzsSNA2a9eo8RNLBPMCuy0SqxE+nglW//YQ==
X-Received: by 2002:a05:620a:68a:b0:67b:3135:a9aa with SMTP id f10-20020a05620a068a00b0067b3135a9aamr22146750qkh.508.1648596342537;
        Tue, 29 Mar 2022 16:25:42 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id f18-20020a05622a105200b002e1eb06ece3sm15856149qte.31.2022.03.29.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 16:25:42 -0700 (PDT)
From: trix@redhat.com
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	hverkuil-cisco@xs4all.nl,
	vrzh@vrzh.net,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [RESEND PATCH] media: staging: atomisp: rework reading the id and revision values
Date: Tue, 29 Mar 2022 16:25:26 -0700
Message-Id: <20220329232526.3238181-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this representative issue
atomisp-ov2722.c:920:3: warning: 3rd function call
  argument is an uninitialized value
  dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

high and low are only set when ov2722_read_reg() is successful.
Reporting the high value when there is an error is not
meaningful.  The later read for low is not checked.  high
and low are or-ed together and checked against a non zero
value.

Remove the unneeded error reporting for high.  Initialize
high and low to 0 and use the id check to determine if
the reads were successful

The later read for revision is not checked.  If it
fails the old high value will be used and the revision
will be misreported.

Since the revision is only reported and not checked or
stored it is not necessary to return if the read with
successful.  This makes the ret variable unnecessary
so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index da98094d7094..d5d099ac1b70 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -906,22 +906,17 @@ static int ov2722_get_fmt(struct v4l2_subdev *sd,
 static int ov2722_detect(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u16 high, low;
-	int ret;
+	u16 high = 0, low = 0;
 	u16 id;
 	u8 revision;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_CHIP_ID_H, &high);
-	if (ret) {
-		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
-		return -ENODEV;
-	}
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_CHIP_ID_L, &low);
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_CHIP_ID_H, &high);
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_CHIP_ID_L, &low);
 	id = (high << 8) | low;
 
 	if ((id != OV2722_ID) && (id != OV2720_ID)) {
@@ -929,8 +924,9 @@ static int ov2722_detect(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_SUB_ID, &high);
+	high = 0;
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_SUB_ID, &high);
 	revision = (u8)high & 0x0f;
 
 	dev_dbg(&client->dev, "sensor_revision = 0x%x\n", revision);
-- 
2.26.3

