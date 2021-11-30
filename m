Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF5768
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 16:18:41 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3S0v5wqbz9vJrh
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 16:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
	by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-CGy5kO58Zk for <linux-staging@lists.linux.dev>;
	Tue, 30 Nov 2021 10:12:31 -0600 (CST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3S0v3yjRz9vJrx
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 10:12:31 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3S0v3yjRz9vJrx
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3S0v3yjRz9vJrx
Received: by mail-pg1-f199.google.com with SMTP id s2-20020a632142000000b0032173c0daf1so10497727pgm.16
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+InRof0/uIdyh184kbNfYTG/vjRoi2ITuATxWqrIaCg=;
        b=QQFpZIXv7DEivrF4SMIk84Xm86N1CjjIpvc3cSlX1cmd9Sy8GbGFq63zL0k5PKJa7i
         bIy7HFYuOq4jGsE4d4RTL4AxAt94zHyzsAjCw35b/P0HQ3vEJmrPcyPSxJRpH7d86KRS
         cu71acBcYj4CJebZkc2z1XlMBRaARx9RlgIlaA14r23AloLlHYesN/0Hdr7EAaieLnBr
         6GfBi4W0uurDwOAhtRKeMvYzmsyocF5Nn923hEE5t5ldSiT38+pR0WEDDTBdDUSSAs43
         s4J9TuzlbvUd7iuwKIOVUeuLVEdepQQyQJKJjvUjghseEyj0mXcL9z6BaHLeGZS3MIf6
         31OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+InRof0/uIdyh184kbNfYTG/vjRoi2ITuATxWqrIaCg=;
        b=nphpTUDQ/CFwHq9kgH/ne3i6wi806No3+YH6NFb+LkQ+UZRcMKB0z57uwI6OCLGpNY
         M/yOPfb8zM3wHsKW152bkl7+6eVFLTBmUxlD5tkSq7iWnlKtHbQ4LbwwcBiHng0CgZY6
         yILzgaq44XkJIvkb8FzTCbTUFaiH1CWmG5rJ6RcaMvuJU7OW9QcSiBjqfgvhylATNQHX
         vxZzZHTQSd+jVLCVlOqXqKQn1mpgUBORkWD311dfJ954j1nK5r2gGWC6LNWGWCp/Edt1
         gib/iI0wLK+Jk7FLvbNxHmZ/l6qrYWLGM//j4cm0i4SLDDGIBmYVkt0JirnWVbrDMWq7
         M90Q==
X-Gm-Message-State: AOAM532ZhqzRqYZKhzJRSNo/HHQg5D5gU/kQy723wNGuf4w0VEidusWm
	RK1z3T0WTZ5hSBZQIbUW7tDFAOlTlO4OCFKeIRcxfkDy7mxoXo/KmDl1pfTiZgyE2ERQR+iutjj
	dXVJyhTWu5N75rtdx8tPKuEg8XUgaHQ==
X-Received: by 2002:a05:6a00:24d2:b0:49f:bbce:7bc1 with SMTP id d18-20020a056a0024d200b0049fbbce7bc1mr155716pfv.37.1638288750664;
        Tue, 30 Nov 2021 08:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+GKwKQHK7uXFjfxjVBqjeb+jOkdeK3mPEahrfjDgFy1kG8HcnLoSHVfN3RaX0GqrIAbyeRQ==
X-Received: by 2002:a05:6a00:24d2:b0:49f:bbce:7bc1 with SMTP id d18-20020a056a0024d200b0049fbbce7bc1mr155680pfv.37.1638288750395;
        Tue, 30 Nov 2021 08:12:30 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id lx15sm3380968pjb.44.2021.11.30.08.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 08:12:30 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu,
	Neil Armstrong <narmstrong@baylibre.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: Fix a NULL pointer dereference in amvdec_add_ts()
Date: Wed,  1 Dec 2021 00:12:23 +0800
Message-Id: <20211130161224.181519-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In amvdec_add_ts(), there is a dereference of kzalloc(), which could lead
to a NULL pointer dereference on failure of kzalloc().

I fix this bug by adding a NULL check of new_ts.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_VIDEO_MESON_VDEC=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index b9125c295d1d..41297c2f8f9a 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -234,6 +234,11 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
 	unsigned long flags;
 
 	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
+	if (!new_ts) {
+		dev_err(sess->core->dev_dec,
+			"No enough memory in %s\n", __func__);
+		return;
+	}
 	new_ts->ts = ts;
 	new_ts->tc = tc;
 	new_ts->offset = offset;
-- 
2.25.1

