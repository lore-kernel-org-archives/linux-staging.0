Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F04C63A;
	Mon, 11 Dec 2023 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFmYwb+d"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d08a924fcfso43244165ad.2;
        Mon, 11 Dec 2023 08:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702312044; x=1702916844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7C5pYYujTe8Y+gPKU6VkmtNi28zjItVjWkNm9TwHU4=;
        b=BFmYwb+djAhaEb20PQbORI4DXk2pOtXJzSjExKkMUxF0STZJiUvYRZN7e48JtXWIYf
         ROiHc5RxIVG9IALzz1oIf45KJPR76B/bUmlgdpiTqJfg8WDzLMqoILrmUwMWA+zqp3oo
         apb4+I8QKDE9kPa44igyQvmIfE4DHAI8mGW6hG9HCUhmRhlducXQp56u/JzVqqHQmAf/
         LFSI9USjy07W2y5o0cfmGfEsCfZ0m2xA5glzxOz1PfBM6q/Lew8IF0oioWOkiO0GWRHg
         xng+R+lzctr3O/ak/Cyaqd+hnx6/X5Hbubqz6OqKbW+kW8WTZCuqLcKn53c8rquiZl+z
         OfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312044; x=1702916844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7C5pYYujTe8Y+gPKU6VkmtNi28zjItVjWkNm9TwHU4=;
        b=Bzov2GnqC0EX5wQLnBmjqe4XPMOGgldENBhgAVr5gbagFLnoYpcC9b7k7ESTTw8Mkt
         sMtZZ2AgaH3shCQTm7oGBSxCqKlf2++YJK1tdJl+BfyyTcYNQZ6qjidrduM/Lt9mgN/A
         RA0LPJwX4DBDk0VlOFQBxAomxihiEQEVNr57Qn4fvTHxmhwYrr54kQzaFWj0Qk8Wk5zf
         /tjlbzj7eC9Hn+QUZwhF3Ae2Amo2xsRPW4ibqCQs0oXGGu47i6gpi/WBijyb4OarLk6x
         m5eU95NbVDDEX1NoWU7FAtIatleuIkIiZ2TGS0wF1opZrMQzg943aYJHEKXgwe2EdykT
         Harw==
X-Gm-Message-State: AOJu0YzgXVn6aESkCq86M7arFukwRsjVoW1aMK3Gh0atRSoGX9IlA+LZ
	f98z4WqO2L5TwYVHFIS5ETB9VB+yrlJdKRZJ
X-Google-Smtp-Source: AGHT+IHUejwNY3e0pVC+q46cvQMgp8ftTZdY40phiMnL32w87X9ox3VmjLoxhqYi+6fl+IZ9hTsZ9Q==
X-Received: by 2002:a17:90a:4094:b0:286:d491:4be8 with SMTP id l20-20020a17090a409400b00286d4914be8mr3522073pjg.87.1702312043878;
        Mon, 11 Dec 2023 08:27:23 -0800 (PST)
Received: from yqt-VirtualBox ([223.166.246.87])
        by smtp.gmail.com with ESMTPSA id me17-20020a17090b17d100b0028a01156d24sm7050052pjb.49.2023.12.11.08.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:27:23 -0800 (PST)
From: Piro Yang <piroyangg@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Piro Yang <piroyangg@gmail.com>,
	linux-staging@lists.linux.dev,
	Linux Outreachy <outreachy@lists.linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2]staging:vme_user:fix the issue of using the wrong error code
Date: Tue, 12 Dec 2023 00:27:17 +0800
Message-Id: <20231211162717.105915-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the error code of ENOSYS indicates Invalid system call number, but there is not system call

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5c416c31ec57..9bc2d35405af 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -341,7 +341,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 
 	if (!bridge->slave_set) {
 		dev_err(bridge->parent, "Function not supported\n");
-		return -ENOSYS;
+		return -EINVAL;
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
-- 
2.25.1

