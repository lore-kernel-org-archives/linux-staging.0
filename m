Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C22E23504B
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 01:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772415632; cv=none; b=NF/IfWw8ifmxdxLc1K/onDrbcmhgk//Y+B9ajtRPu5zPFwGaOAjEAK23/c610JLb31rKWKgL2ThvxqwChwOVsYrtmRZraAF8WxmZ6DlcVqabGPxQUk/9mv5ICwniFxJl50ajbgy1vmy74cwPC1NtMIU0vIQO4+GX2w0E7JYbw8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772415632; c=relaxed/simple;
	bh=hNvj2yEzCce56qoFy0W7uNGb06SsP1dL/bz98LdIJLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDG0AXLrnlYFFbw3gmmDOCWqL6UuQUOM2SuTIXoS78IEbgvzO9S0+KmKlmw6h/m7aO35BHNI93bqXYsl42IJxKJa8DFQalXCQ6CfzG6LM4LsqBN+nG8Wa/4xfXCk/QYHN06vcselUzvXhIL+bAMRGPRgLEBLQ8Evn49nhZu70R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqCHUlaD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqCHUlaD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-827390e8a3cso2486337b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 17:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772415631; x=1773020431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dvrkUmWHzhfCud6PY8kab8MNaXmWzLWwzkb0HLaVbo=;
        b=EqCHUlaDXEeJl1ufBQJWpXf+52mJqmcjkO3by+KBfGxsRkXaluiiJWwMvv0mAx+jm+
         iC08Mghf+pVQvLCqIgbIqQAiZ+CUUhSvpiccKmcFvVbi8GV7krf3xgnuvbm/CuE/hiLq
         N/f5NR1ylsMQMz+BdNW0jfwUonUoSoutnRbxX+/9vn39UT3fwtuY4DK7awfmNqIjRS6W
         h2UJTbNiKqbAtUi9qrQri4TD5iJsXQaaG9OLir5KU2jH7AQ8Zb9DJhnAohPFD2t4tfGt
         RUfAvxpj/bnbU5qn7EOZIfKHQrMiXBkr9AsQk3QvGz9zUcm7R0PdSUir31M1l3+neb4A
         CDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772415631; x=1773020431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dvrkUmWHzhfCud6PY8kab8MNaXmWzLWwzkb0HLaVbo=;
        b=fZ8zf2ss94ugu4djAPEgWxdE0NIge15+beetxYtmiYPqipbttQpPmnVSm3qt4DYO2X
         dMvRRossSIEonauwSyqo4Tj3g2TAZiZylJUDuunCdU7cPJcSt+oDRC7y215Zgx53R956
         CPL1m6mepFqfuWBssFN+8fSNrZnylkZz8V+vVAyOytItNYw+JmmUHgGPMWY1EH7fmRV6
         boIfxg/SgODKrsjXWvfjc0DNW9H867Zc8mYI72u6PocO9UtvQc++/rFXhRzXm43+mt+r
         YjQCpUSJnVc9pFg5xk8QRT5977MImCuZ7kDsaYOs6xTuqTfIAxzfIwNas0yzca8oZMlz
         7f8Q==
X-Gm-Message-State: AOJu0YxxwSdSoKWhvrkhWefGRwItsXEZUdkcB17br+zrlvviJQ6dNtFj
	ijJs20B5xGjFgLPm0nqQc8JII/XZsY4J4ShjKLRnxjVGeMdkLoUzXshB
X-Gm-Gg: ATEYQzxqA0wXqWVQ7GZdAC3M60Cdz9qVDhSStCGDud/WIGDK+OL7CltS/YkLCwZqIJd
	HqfROW7NEIbjj6OTnxMKaT1+dDpTA8WolSFRB+UeWp7JiY3907Po9VryPyewcCdhYHj3ywruApT
	1BKCUshCA0eYO2MHGtkMXHoFReMMLD+OvUIPTjQkkLxsXgpOQ8vs/lOhHKP0bAnki9uJBQFyWw4
	ULIotX8ds3Gy1FlwBSmW01LIrY8b021bL5Yv6RgQ0Piw0hKF8DFxvW9eLlGbkIwubSWfoXBcvnk
	1kDMQaDzX2z2ITrAXJM0xSu9uM1b8NYNQje2iI0JrybQwLcB2+W+WZt3ww6khTUtTKC95jlnQZA
	o1lEYGzL3iu6bi7sC2MDqEQQJxlYXWSj0xEwNIlCLXvQX3Sd2K5212BJ3wIT3UmaL+W15DykVqv
	XAZc7fdX4pIMLvPgigQnEbZyYBW6Q=
X-Received: by 2002:a05:6a00:2296:b0:827:300e:f617 with SMTP id d2e1a72fcca58-8274dade073mr10934507b3a.7.1772415630868;
        Sun, 01 Mar 2026 17:40:30 -0800 (PST)
Received: from linux-dev.. ([104.28.157.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a029b13sm11773236b3a.50.2026.03.01.17.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 17:40:30 -0800 (PST)
From: Afkari Zergaw <afkarizergaw12@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Afkari Zergaw <afkarizergaw12@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style
Date: Mon,  2 Mar 2026 01:40:15 +0000
Message-ID: <20260302014015.3853-1-afkarizergaw12@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert a block comment in nvec.c to follow the kernel block
comment style where subsequent lines start with '*'.

Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..0e655f79ea4a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

