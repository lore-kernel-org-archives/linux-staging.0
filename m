Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB281D69C
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709556046; cv=none; b=Tx44egEjFZ9r3t/PxmPfvR+GAE+vh94u/hyJ3KwSAIr3WijEOdNOHcqlI6ZjWJDAJWub/GLzd0iD5GD+297iFeeFGxkhgW/EMBd1VyphcCVYCHkFpNIiiXAUIV4AmikPleUm3HNZrzHMpuudrxiO/qmdLmFV0WMp9suUj8bXvcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709556046; c=relaxed/simple;
	bh=dy4JEq/3Jdg8BCVu4a68i74gFTDVbWl+HSJaGNxFbAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JFcmjAMrRdyOw7H2oJxIPaex8qJNiOjEcdmL5UcXAYS5OVtqsxef0pbiIynS7TQcQm31ZEf9Sp/A6m5+/gZA0bBY2Z7tR31nQ7dX3xgqkdxCSirU3gFbDg8aeeSfogBC9hlKSF/EseojIsEdNNAL/U6ub6Nl2OSAsudax7eiJko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE+7dbfv; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE+7dbfv"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5673f7b3196so1398441a12.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 04:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709556044; x=1710160844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5trdsWXQ1l+BmpkQ2xBDJEcjKE6ifeu1ZxitnKw1Sr0=;
        b=iE+7dbfvOyML6kU1gpvj1KPR4rnxfMsfsoSve8APyl3ZD8CyFXJSyuJ3yat6RgNjFI
         VWEdmdZyXsUuRtDH3FpNJpLcZvAO5YKAuGgcZ0uKS6HJ53kQaKsHh5cUZyFV+jne75Nf
         NjL5QHlXTsr37TahscJfn/ydHapOhzi0y5tLoVuXtmxvVFyFEG34Ygoauv1LNzg7mY1M
         N2noZjNYTOWCIZ1T74tCqhx1ZyhA75Ld6NDseJ2nflx2toaTro3cf1yXdRd48D2c/Cqw
         Ksr7m4FDOmPCmfzdCt25W5B2tY50hbUsKkYY9EAW1Jrv5RvRWIHsxCdqAOj8bWfMPlz3
         XHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709556044; x=1710160844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5trdsWXQ1l+BmpkQ2xBDJEcjKE6ifeu1ZxitnKw1Sr0=;
        b=f5SGMTkjaA0XmNN2sv900vjPwGjHVABUCJUDVse7gTc+MpB6zFmdiJezwGmzwHZe28
         ORYgQSQG4fAk/8lm9YTI074muYO3oHQ6p3alnT4bVVhY3ercS+Hlj1WRDeqNHBHQ7nKX
         oKH9Vuiv13G3ATPvzG7g+4+UMywJBllGTdo+QdxfNULNUpuTDGbuGYQan2VKQnFeuchL
         3A9r2nhjv55YiSi9zMV6xSNsF5IV0z5vQLWtyx+sQLjRbPw+A1MQbFqpHXDZhI1mkmEG
         jKVG7zO46ehR3KP/r2R+UGXkeTkfFv30L1q/bQxlcupFVdLhhwKE2ThCxvIZKk7+zXLE
         Ecsw==
X-Forwarded-Encrypted: i=1; AJvYcCXso6fXgMYJV16URHd0pym9RNhwtFXxgshVZbIrSY2BEMh8JcI1GL2OdQ2TLgzTH22r81SHdZQaWutDEy/vpEl51HpCa38uXv8LHgRORg==
X-Gm-Message-State: AOJu0YyaZFk2Kw8YPvZScYS5JUEmOJXyDDz6TqCtJ3XFd8x949vgH069
	CnBpaPrJ1Yed566C02FRs6SKVmUG6HfT8N0ynZMX8/is0wkn5qfm
X-Google-Smtp-Source: AGHT+IExn5o2E4zBYdKKGkt+XPcIkPewddUbj9u7aLuic8T0O9BmTQRtZQJKqF+kyzVnbiA5h1QxqQ==
X-Received: by 2002:aa7:ce09:0:b0:567:6b59:90bf with SMTP id d9-20020aa7ce09000000b005676b5990bfmr582902edv.41.1709556043324;
        Mon, 04 Mar 2024 04:40:43 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id dh18-20020a0564021d3200b0056760e830f0sm651747edb.81.2024.03.04.04.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 04:40:43 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	philipp.g.hortmann@gmail.com
Subject: [PATCH v2 1/5] Staging: octeon: Match parenthesis alignment
Date: Mon,  4 Mar 2024 12:40:02 +0000
Message-Id: <20240304124006.26819-2-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304124006.26819-1-dorine.a.tipo@gmail.com>
References: <2024030317-multitude-pelvis-bcb2@gregkh>
 <20240304124006.26819-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in cvmx_spi_restart_interface().

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 3e7b92cd2e35..44cced319c11 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }

 static inline int cvmx_spi_restart_interface(int interface,
-					cvmx_spi_mode_t mode, int timeout)
+					     cvmx_spi_mode_t mode, int timeout)
 {
 	return 0;
 }
--
2.25.1
