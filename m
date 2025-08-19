Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99001350844
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605833; cv=none; b=k9GZFqZwgDYGRImidY1XwU8b6Ii8a2wP8OmrHitAtAPpkp3KjMJmZA8ObkRowj+L1vv1mAxnAIJlVJpGT+gEn64kdqStrYnaU2/bFL80OrC5HC8Jq4zWfQMQEHi4PGGsZ8HhEnzudk42XYtpY8sRgof6nwpXxAD86iNlc1AGbH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605833; c=relaxed/simple;
	bh=K9nKCMbcMP0yXHmTeB74OB3Tdfhh/E/inXnAw8T6vUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7ymW3nkhgoMNWmx8Peiwv/V6HaBS8EejiZD8bVHIA8CkMUJKtFphW44ebEO/p42WbZAytpT8VevUB2qlTK5uJR31ddG2U82y2lacVUk8Da5tkyPPq0RTer4rqmVCQVMHrBDlDzHWS0Uro4BMUimoKDgx8423ggz0i74OwDUJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdWjTEx+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdWjTEx+"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-618aea78f23so5303979a12.3
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605830; x=1756210630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwi6FW5tkDofq2KfQKNu3LIz9dY4yfYtr7joa3HTroQ=;
        b=IdWjTEx+l5/gn5v0sVmAghxAEBfdE/9lii9V1O8Y4964cPzMGruQ+40teJVJE7TQeR
         rnpqBBcBMiJUFEW0Lw5/K//JKISJNYifOwmp45tDiiZgFDhMqq7Qz4SkNuomqWurcl0h
         xhniC5P6BHUM5Um/qdoPbqjG0UUDOY1wkdVtDfJiU8AteszGTuOsGKq/vlecNK6lj+bI
         PYJjOcysKUGdu6d58r6IJX2xr0zEHKmHXldFrIZNSFVbXikGBVTLHc3aErBZ0WYrUez9
         /Lygw5lnJZqAv+l3Hbq/Hk0jkeW7Ur63PsGIvOreiuw7cAHn5aZf99NA1TJg6DjsRXOc
         RL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605830; x=1756210630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwi6FW5tkDofq2KfQKNu3LIz9dY4yfYtr7joa3HTroQ=;
        b=v9363WF8hFceGslR/RapW/A03SRR80vfnqfTpZ5Hu6i2RFORRDMmiM3Ukpim0XSNS/
         ZfkxTijiUr6tMwCSuqBnw8RHjHP9vQMCTFfxZ3mjqockUD+w5kzSl9cio9Ho5as+9ZyB
         5Fx+6x1ZtAlKT/u9G8KW+VXLBBQ89S3dIb1ApIYDFeD2MtKEYI27tWBkfvUimH8AV93g
         tafPG2e6bLcWbod0FrsaQTaPiSeqXP6zAdUS8xnPYoS4RS6MQt/XzkeoBI3WegXYHB+S
         FnOpgaZlw6Ktl4ovZEo24hcnB1UhxrzQpMUeStH9TTP3a6e4aLcPH3SKVHA73cAyouAs
         SPEw==
X-Forwarded-Encrypted: i=1; AJvYcCUEokFdvF1Jvv0zxXP+h8W2DB/34OnmKRbW2ycz+NLaTXSgQQ63wDv3gkdx18NYYsizBxOTO+UxlBmNxDQy@lists.linux.dev
X-Gm-Message-State: AOJu0YxpdF9WrCxnp2pHs8N15lWmHVxw7vYTrnhxhUUQvABd9/NH9JkX
	djI44LtUBtCAm/M+pIG+EpeNzAZWowDUaFaytvgqm0Bw8JgDHksdXaJO
X-Gm-Gg: ASbGncuLLh7qbhIWVIzfOKCUIDtWv+Eh3+0UnO2B0nWXyGxSKnnFGs3ala5TKiZCmvX
	0wZSFSSY7/pGjDZY+3LVEeAhypHgrvCnz7sqASFdJxdtBdoK8iObk8Tn3wl2B7fzNtrGWJeoPiz
	Qw3h4ld8HNv13aCtMUk6ZJZRQyhnLLFVs7eiYcIj2R7+KUtqcJ/0IZzshLD1jf8YNuefBheayZ/
	KeVuQ48GwuHO3cpaQ8PcOnd7T6YPEUvRP2VeBypq5/abvYWdZoTXofamJ90vXubTZNppOUkN0Sg
	0LvtNvyPHpjKsEdgSTI/lhFyEu7sW+L7iQd3FML2dZC8e61jPT6zvfRSkjr0ApsPlZNkUjMPx8c
	2gxzabCZByjYuOwmQx1ee3Tk+
X-Google-Smtp-Source: AGHT+IGR21hvJiBGCH6Sbixi0M+53WC3OCr/Sk/5ODegpiy06wxb3jQkbalpqFcJAtPFjRUjEnbGKg==
X-Received: by 2002:a17:906:6a17:b0:ae6:d47a:105d with SMTP id a640c23a62f3a-afddd208983mr230691466b.55.1755605829730;
        Tue, 19 Aug 2025 05:17:09 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:09 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 16/19] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Tue, 19 Aug 2025 15:16:28 +0300
Message-ID: <20250819121631.84280-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index b466fe7f4504..a06afe91d2de 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -496,7 +496,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	int output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1

