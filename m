Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB8B354FE
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwVmGx5f"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so19905921fa.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 16:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697844230; x=1698449030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6AsKFzmbJmMlgO7Kg4ODl3MalR7AIPucYJJTFRtUoA=;
        b=lwVmGx5fRJpU2MBDS0ridvfm4Woaeb62XDMJEpTBCj4pHluQ5IeC+i0tiiOv7MKCl4
         K6FMkyO4lLhfzcbyO9eFMizFCIAqzqicg2y/qGtTGYk6Wrazs/tEGLUvVCTYBB9w88nN
         XEe1lh7U9X4CsXlcqEHdo9RGMW9d12nzAHzNseE/UrthEyviwbRQWL9J3yakwJ/AaGG8
         mF+BJi1OTrCCWZG6zIV80FIjLZcaKsi/L8kcLJsOaIYjpx8/2+WsTcx9VMRDqwYpAaee
         kIBv9a2pkR6j3cFK6O+ofrbg6q8Czkmh+S9Q5uiZzVBgwlGx8u7+KhZW1HGRuW4gFdHt
         0+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697844230; x=1698449030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6AsKFzmbJmMlgO7Kg4ODl3MalR7AIPucYJJTFRtUoA=;
        b=Fd0QGTXd2mG1r3LXhjaorRQow5Py5kfkwU1EThJjTBE5p0m6qbIJfjnpx0yOOhfkQT
         h1lslLjj8ZDEalhwqZKir8FIRB3yza1jqA0rQA9jGBIRx510daDzczwdn6Dw0GVJUKvY
         Rm3yPte+DkMCCRYxsslreHPuYDULI1fa5l+Y5/KEYn4kjQUiKHF1GO7dHRwLwqkdhE5o
         28cdFq1sljEO90xc2ScVr3z9oZC9RkhXx9cls1ho1c4JmvJFzIBP1L35vlrbspvbM3cS
         4ipRYzLGLKY96ZutJRq+hPE8+8Kor6bgkAWoCm4VuIYY4wwKsNPRx0tQn1gW7feOiaPy
         wSvA==
X-Gm-Message-State: AOJu0Yx5OHCCQCWr+TznYBEnbdfvSVZ2g6OvUJ4iVb1lNdCfl8wsRVl7
	kDfdioI71y7VbJtGm5cOYTc=
X-Google-Smtp-Source: AGHT+IHEgX9LGQdLajHEAvwReWMNBXEMzzh8ebTusZ9c64zFGF6PT3ENvn0pOpZ5abzgBQVqV7K/Lg==
X-Received: by 2002:a2e:8619:0:b0:2c5:1989:ce1c with SMTP id a25-20020a2e8619000000b002c51989ce1cmr2244449lji.26.1697844229984;
        Fri, 20 Oct 2023 16:23:49 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id s5-20020a05651c048500b002ba586d27a2sm567571ljc.26.2023.10.20.16.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 16:23:49 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 4/5] staging: media: av7110: Fix 'long int' and 'unsigned' variable declarations
Date: Sat, 21 Oct 2023 01:23:31 +0200
Message-Id: <20231020232332.55024-5-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231020232332.55024-1-bergh.jonathan@gmail.com>
References: <20231020232332.55024-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the following warnings flagged by checkpatch:
 * Replaced 'long int' with 'long'
 * Replaced 'unsigned' with 'unsigned int'

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/media/av7110/av7110_av.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 880fa8a314ba..82d4c02ae3ef 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -71,7 +71,7 @@
 #define SEAM_SPLICE	 0x20
 
 
-static void p_to_t(u8 const *buf, long int length, u16 pid,
+static void p_to_t(u8 const *buf, long length, u16 pid,
 		   u8 *counter, struct dvb_demux_feed *feed);
 static int write_ts_to_decoder(struct av7110 *av7110, int type, const u8 *buf, size_t len);
 
@@ -589,7 +589,7 @@ static void clear_p2t(struct av7110_p2t *p)
 }
 
 
-static int find_pes_header(u8 const *buf, long int length, int *frags)
+static int find_pes_header(u8 const *buf, long length, int *frags)
 {
 	int c = 0;
 	int found = 0;
@@ -637,7 +637,7 @@ static int find_pes_header(u8 const *buf, long int length, int *frags)
 	return c;
 }
 
-void av7110_p2t_write(u8 const *buf, long int length, u16 pid, struct av7110_p2t *p)
+void av7110_p2t_write(u8 const *buf, long length, u16 pid, struct av7110_p2t *p)
 {
 	int c, c2, l, add;
 	int check, rest;
@@ -767,7 +767,7 @@ static int write_ts_header2(u16 pid, u8 *counter, int pes_start, u8 *buf, u8 len
 }
 
 
-static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
+static void p_to_t(u8 const *buf, long length, u16 pid, u8 *counter,
 		   struct dvb_demux_feed *feed)
 {
 	int l, pes_start;
@@ -1030,7 +1030,7 @@ static u8 iframe_header[] = { 0x00, 0x00, 0x01, 0xe0, 0x00, 0x00, 0x80, 0x00, 0x
 
 static int play_iframe(struct av7110 *av7110, char __user *buf, unsigned int len, int nonblock)
 {
-	unsigned i, n;
+	unsigned int i, n;
 	int progressive = 0;
 	int match = 0;
 
-- 
2.40.1

