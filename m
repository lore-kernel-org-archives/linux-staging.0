Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307B3FC0
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 03:47:17 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id ay33so1513563qkb.10
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 20:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RhNvjC5FbjNYONwOawMoFPjO3QiHvU6DiO/UBhQ5dKA=;
        b=IaobpgR+fgGfoE4JtceBoeSJVKme2DRf/ab1fwPCBbyifezuYtetDYNa3HL0vwxUeT
         FPsjRYBvXPNq0OqunTCkIPxlzpcx4OVErwM9X79z7QjhOV75eNrk9N3WltQOq5FxgD4w
         H4X22k4Yj/3JZ1I+unrG6NSKaxys361+Nej7o9jaIe2/wJB4QwkePFKHJRdB2g+66miW
         HTzTHcZjDxmqE6o3n2EeCBlW2kd0c3CCBfChNe+1lrn4h8g0/X49wwJ28l+2wjok2UT3
         OQuoBHXVzwsKHZQhzVcIPJsSQ7jUaGMUVn59Z6DBJ0wOrNIjVu40TSwxjelWldarIJlu
         cQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RhNvjC5FbjNYONwOawMoFPjO3QiHvU6DiO/UBhQ5dKA=;
        b=kToItu3v8ezreuGGTlaukm0HtTDCBOymlEGwryFeKmn3b7KOh9+cPkeUq0aTJu6ZeY
         +3wjUNeigvZEbPrQSmFTHNH/mLSsYyKmhb805A2vfhMfYmhbkzmnrDUzm3dgNJbfBmXp
         kPsBxKkIlrxfP0lVDRAbTOmOrFBJyQ/04OZwL7sneJbdoOnAQvGpevcSFNlg+1drM9Cv
         Da2VhABOdFUNH5+YiSagCh8YkmAuZC5z1IbgdmAW5UVHrYD1RJMoAS3vNedbW1YTk33q
         waRQIRSncDQJayupz5MZB4UxJmtLvxNF/KpBhKu+HYEbnM9qeQVtCkdkbYSdia+GNEaj
         0JZg==
X-Gm-Message-State: AOAM5334RbNbw8VEmok1AAoW3q+JiQ6uZvc2KFch5hjgoa93/Ur9XIGO
	Pu3LbkSZm0ReueNh9PUwNjg=
X-Google-Smtp-Source: ABdhPJwTc5lmnPDsB/8XGFL2k+dfYCuGkf+alRAXrKme1xV5LgukTboJwN2oBoworvB9t1l+EKyYqg==
X-Received: by 2002:a37:681:: with SMTP id 123mr11901233qkg.53.1629517636953;
        Fri, 20 Aug 2021 20:47:16 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h4sm4072652qkp.86.2021.08.20.20.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 20:47:16 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <jing.yangyang@zte.com.cn>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jing yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] ipu3: use flexible-array member instead of zero-length array
Date: Fri, 20 Aug 2021 20:47:09 -0700
Message-Id: <20210821034709.28061-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: jing yangyang <jing.yangyang@zte.com.cn>

Fix the following coccicheck warning:
./drivers/staging/media/ipu3/ipu3-css-fw.h:174:21-34:i
WARNING: use flexible-array member instead

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
index 3c078f1..c0bc57f 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.h
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
@@ -171,7 +171,7 @@ struct imgu_fw_bi_file_h {
 
 struct imgu_fw_header {
 	struct imgu_fw_bi_file_h file_header;
-	struct imgu_fw_info binary_header[1];	/* binary_nr items */
+	struct imgu_fw_info binary_header[];	/* binary_nr items */
 };
 
 /******************* Firmware functions *******************/
-- 
1.8.3.1


