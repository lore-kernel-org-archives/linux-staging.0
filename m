Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E537F729
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777403; cv=none; b=Fs/h7wp5TORDPMSFo1lC5sgERMVS3y5kVTwQkr+4ORRi4xrd10Gtqe/P0gWpkK8lMTmEW4RnCjhwdc19wTKAVYwT8v/SBevRNRry3N6OWKMQP3MNJvMFyDGaP6AubAFqjI9pdv+2S+AkKBE3LXIKHzuXKOH2ZHiL0PSQFl7CFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777403; c=relaxed/simple;
	bh=4Y6GlT1FtG8VTSEqElibSSfmV/oqQEBBF3NI80Dhu3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s49782BFdZGSVLJbCIoVnotKqKX6RxzAz9j0MCeMCb2jp/KuKXrQQtf+DolUd8xVpTBHrfv3FIAKODEeOXhK+TEuPO8IoaGzWRAXhYldC+bwMVK90xRrb7JAZZ4TwdVjyVNwBc9J1tKkyNvFhFeBFJLocu4/5TSmmTWC/Pj2/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLFl6rVi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLFl6rVi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so16658445e9.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777399; x=1770382199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZTvAgzsdLyPVb7r9icvoh5jhK/kCdwgL9RfYNjUTH0=;
        b=BLFl6rVi6CJu/kwDeBIrqt+VXd8QPvlWaQhSpw4/LhG3xy4uar9AXmkqzgFqpnt/TR
         LBVoIkmFfo4x1WWfVqQh67S71RHw5GwehEFkikgnavN9WOniNzy9f79tyCfHTa/z+geh
         ciE5EaQBvpQswnhp1oaOEIMv6XRTCe6EpaQiP+1jTgQUS2RcP59tsAnh/Xd8pB5JoAGi
         9O3aFtXBEivOu446A11FeX3aOMzUUJJEmzMZg6AYug+Yhrfk77gj4WYOKPqhEqXNPzRx
         4IPC2c0eg4BBFujtPcS8MRUf17rbBFepscsIfGKY5CHbeC4SmiB/dggt1qTp2psvIfq4
         pPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777399; x=1770382199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZTvAgzsdLyPVb7r9icvoh5jhK/kCdwgL9RfYNjUTH0=;
        b=u03QBWFZoj+BumatbOPeKFuJN7Pmk+isNXOg2dhbaZbk8rzQjPyZTSJb0mIKAG0Q/s
         AfXh5maDfK7ArIiqeor8EsKANt2DIaq1MRYYCP5hYnDdN4B5FEcsicNxxJP2soOIADjs
         Pmd2/LsMKEdoZcPKIaS9epUjgKPdDONSvCAnSUgM3pXBa4yS3tzk0M0IjbCGSQLwEeOp
         vrvPkUBUztJAvn9MK+N/Q7+YlDnxxkwfoM6AOhkrhQ7TFJYFIvHEUgKkRdt3Sh3gar0d
         xf9YVqPlliJpKvVf4XuxOrcP9hxyxdWYudGjH/7o8zvqe1+0xmheKzNIeZaYLv0jmZcJ
         /iFA==
X-Forwarded-Encrypted: i=1; AJvYcCWT1f6PMMYwYJmWYczbT8TOaYyPJWOyFJmY+mlGTNfPA6GOvQNdGDe1DHA4zFp9uuzOUu7MLXoV7SkPypow@lists.linux.dev
X-Gm-Message-State: AOJu0YyqXJ9pQlxqtvXZnPzkQdz0g4T7s6bmjCU2iYKSM3X1Pepav2X5
	fYULqFqET3EKQR2BYFYQ7W1glYc+6OAHRX14qaMnu2pxLDksCbqRX0Ty
X-Gm-Gg: AZuq6aLB86w90i5rY4tKRKdTM5rNCQtvZrcuz/+/XF7JJgYhN9vX043tqjZ8IhZXOzs
	rJyqcLiNKFEVFI217YDkh4Mgly6dEoD9GXvO88FTJyskKfC0wux3h1gov1VVh/g8na3mjHh0JVt
	IB24evwJ8cDa8six+U8ZNYd4P/ZXgleSEH4KETqvIXLVGlvWVRME9kBzkzN78MWqzYYONAXtqjH
	AcEq4c3eWSzujRVrS1ElJL7/eOprpdJQ2F9fboNCMjTyzo5BTfRW2oQcTZM4d+D/XY60RImbqbc
	1k/d02CF3oZx8sGU3aI3IanL0cUkoLn2VRnE+Y6R2UrO3SdZUjD87uwVsLq5jMRoeAFcnJovnj/
	8+tI+Ij/QrZsn6IQpw6awA91p+JUGX9qYuOUr5duufV9i3JRqX8dzdcOPAAwQCgGgQGjXeN6OZS
	lk
X-Received: by 2002:a05:600c:a08c:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-482db491ef7mr36328755e9.22.1769777398808;
        Fri, 30 Jan 2026 04:49:58 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 04/15] staging: media: tegra-video: csi: move CSI helpers to header
Date: Fri, 30 Jan 2026 14:49:21 +0200
Message-ID: <20260130124932.351328-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 3c3f6e3fd1ec..894583d48b35 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 609c5952e050..2b4d586d3845 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -155,6 +155,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.51.0

