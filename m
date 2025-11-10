Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D63064A5
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770322; cv=none; b=f1OPoCEwougOH0+aoF6bjbWvodP4GnVH968Dbf6pEfKbxIlO8GBMMqFDVW25QUf/m2ZMPgJv1DBaRH845bgAJszP6wtYabG1H5YlqmKW5axwvNxpvjVquiSoO0QN4TzdAhj/w0MEacCiqYFvg0yWWd+5AoOoQ6BwGLSPxQHMqrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770322; c=relaxed/simple;
	bh=FXUqYMZnfN5Gi7RWXxlAVrm8ut3iIYY/hLIiU/JBhX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qsa2LQxlOY6XDUmub2OrTpK45wdeK7clK3Jc9PFK7jwi7q4OBEgD0C1a6yRUrhYwtw9lQB/WP1Km7gfmTapUv8/lGKQTHE1jM6/PjpYmvlnij+FWE8xdnoJxV2yBcXFeycJnXvmlpN/fJwwm9kqXFjLhO2JKRtbyy2H1HtDZrx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGsyfZhf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGsyfZhf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471191ac79dso29586225e9.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770319; x=1763375119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75jPLUceKbQFKC4sC1cLZmAKzBwPWWFzrFIBzJ/58I8=;
        b=CGsyfZhf/3ME18sS2ZfRlMrcZhTsoo1ez3IFExMZVICNXMS/PgWIttwgHXkNkZ+Cvg
         nLeL9Yy1NmTO68MyzAvyxV6OFvga/UmFNDQzdnTf6Vrwf2fM8EhH3BhvZX6SAz1gWTnf
         yjdTxG6J5c+WnZDruz4AsWMaodM17XMpffcEQZWwf3aC/V0RkocT+qa3NAVmctfJYcV/
         iPCz/ilPTo6jQxff6vjOZxJnBABjnFA4sa1DfUpUbsFlgbf9E43IVtCKlu4apQuf0IAu
         26QPZjQL8bzXPk3Xd2XZ9iOwzztZNAsUvDlfyNNQA9olG6lzHP7XLber/AeV/7vby/XK
         gCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770319; x=1763375119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75jPLUceKbQFKC4sC1cLZmAKzBwPWWFzrFIBzJ/58I8=;
        b=svoR5cpsXt5gSB7Cq4Hjyfn3F0IBcWW0odRKK9Yq5AeVkH6wbLjo11/VcfL4n/azgi
         ackpiAG1qf35laetPoxrK/YE+KdUgzax9weCrqmkqkhZoWXjRGI+EZ4zQEyQ4No8Nr0i
         Dq3pxRlU5QGvwhLHp54P4bskQbwkSCeDWuxCs1oc74sCZH1HrFLs2R+f7L1e+imLIr3Z
         hZX1IUMS+U9uQZE9HEBwOoRA2DTQnC0509zEtWU36qPk6HvxjPex5Q8O2KXYEGTdW5mL
         k2RJF8xkehRnafgpPelXUweENRcPpBrJZnDm8pWOKitTZyXoh4oIOoimrVrKUUm/vM50
         EaqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2mdbYThEW9+yh8h0ItuSmpnA8VqAY0iOGzub2L/FdHdu6wdk2udFTRyFd+ZIbhYjSj/Yy59XagMwhxtQG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8viT6TVLA33XKln+4hQtOTHJq48w6mZZ2eHjrMFoWy+JTsNr0
	HQvRTH6Hw5T1Rk+nSZJtwllzKL55b8jac2Zdr7+BvcVJwY7MUUxI5G0j
X-Gm-Gg: ASbGncu0VjADmcEORxmUYQN87YZCQV0zf6fdn0qBQV4YD2ZWrzlWAe3NuXzPnpZmIBW
	A9GD1h7nLlyMMoSZZTSGyptTtycRrWvQMy37JCLjIKyCch72yD5oAre+T89OK30Qe8KGT27nQh2
	4J0qLh0mqdtaazC5nEi3Y9aINJ5R2T/NTPs0w6VbGWW4urU5xVFcBAFk3r/79h9uERQfATU2mQC
	RjjWvr8jEyc7Gi2ZpFGjLY+j9DnizeOqnNAsYVZYZKGfKwF2Z7+zrZClpWUJLTDiwgq3yGgBaoa
	DsjsIn7KiryGuypKrNYUs24cU0GOqj80AKhYkICQFhZiEfR7S4iuSNLApGgn/VQ+dsXvueabFhE
	IiqrZAGdROqhp9mBoYoCHcgsVlXEnEbwbJFux+nU36j+crtcsvqdkeOGjsRuVfCG97KE+U4EZcL
	4y7gdo34WLIhTVG2QV
X-Google-Smtp-Source: AGHT+IF2/wLGF8U7IqobaReUdjkP+2v9OJwuJLYTpHefOZ7znmN+FVB5SLuCNT5E2bJ1o6OOY3CNzQ==
X-Received: by 2002:a05:600c:1d1c:b0:471:115e:624b with SMTP id 5b1f17b1804b1-4777323ec6dmr58832445e9.17.1762770318704;
        Mon, 10 Nov 2025 02:25:18 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:18 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 02/11] staging: Remove build of gpib drivers from Makefile
Date: Mon, 10 Nov 2025 11:24:58 +0100
Message-ID: <20251110102507.1445-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once the gpib drivers have moved out of staging/ the build
rule for the gpib drivers in staging is no longer required.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index e681e403509c..f5b8876aa536 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -13,4 +13,3 @@ obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
 obj-$(CONFIG_XIL_AXIS_FIFO)	+= axis-fifo/
-obj-$(CONFIG_GPIB)	 	+= gpib/
-- 
2.51.2

