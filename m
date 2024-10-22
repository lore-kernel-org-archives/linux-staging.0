Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A4156871
	for <linux-staging@lists.linux.dev>; Tue, 22 Oct 2024 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620490; cv=none; b=BkywRh9amF1ie/rMTeIeSvdnaNXp1aQIZw0KI4/83m7f0WfitE0AawR7mU9hBKyU9ddI0FiT8Rf5hEZ5BsJw2h/EOnRHogjgEZ83IUwuhb7JfE7U5olYSel4rWidCggn7lpe6lMJXAcKTh39GLvZoxXoyl50iSalk34VUGWAhNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620490; c=relaxed/simple;
	bh=Qfypyu1Nn2V+3gcNfw82SEJviEnlpQZXyb16muLLWlQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ceFSllv7F3dy/IJSIRi8RQV/rmCyHcUTdtb+U/m+LjmTXfvSXYXU1zt9YuTFbqZxSkJW3ziL00YbjqrmOfJ92JZZ0CkmP9eT3poA8yFE4AmcyKRMNwMAjgrOpeNPcEhilMszOXnKpe1efrB3EuCRgat0OHP5NxyopB/BUQs1e8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HS0vw3vL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HS0vw3vL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a4031f69fso863572266b.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Oct 2024 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729620487; x=1730225287; darn=lists.linux.dev;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHKeAVy/sqJfWF1Y1uRllNLeoPiow2LfJ2lXuumLr4w=;
        b=HS0vw3vLajrsNCtQ0Go197jv1vUmHYIH23YjQgwFoEJBIVpH00A9cmMS4Y1dbdrZhM
         amCCEoSqISHs3RFTbiht6roLMnuie+K0amfDiF6OOx/MC4zNa6UKeHfuSFJwHcP5HZ7H
         G46gtNhrZbF4h1Af9T4MSsZGZ7LvOc5EH1V4MEKOanqEWlDS9z+snuKJhrF7+0naq/j9
         u9r6F/7TfJS0cW2obYxS88T1dC9tJDCBH/uFBA850255pIy6ANjuZ8AzkjvNZ4whH5Ap
         FsGKKjO0H8eMRb3mqGn9UiV3EkQGwaDwKy40mB36VCUEPYRAt3uVgVbr8W9gkLMPcqxB
         GSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729620487; x=1730225287;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHKeAVy/sqJfWF1Y1uRllNLeoPiow2LfJ2lXuumLr4w=;
        b=PAiV3Kh38dRMETHGa8w4D7eM1NkjheUfNQmNZ4GiNKIsaa7aMVdRiWtENTL7aX4/zU
         GmzEFJK4bvIezWOPzUkKA0B5Wa5qy9ESF/trdTw8FLIevGjI+vIF0IInby0Vz7Mup5lB
         5q+h2AvG1senslWVTCrvNkJI0DZxDLgbFQnD4EjNZz3v/38lAmQAXvvXNRvxYBzR3gDr
         qKxvA1xUdcA/JwRpOWiCSurlQ6zwE+XWrKAcG9pD+ide2xq4AM0ywqaniq4cyF2UikNL
         Tw7OJor9jqEsl3vV2tI5o9Pt7z7YzEmr70JVzVfneQ5OhZ1gaxl1+em+GoB3No2w5cl5
         L+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXAgoGgEDCLyQ+V8uYdFpiV6lzC8dg3oa+GDd7ly4qELi3zPDXGqZV+PQ8mNFs1A3pPfx+llMKYjYGkKfV@lists.linux.dev
X-Gm-Message-State: AOJu0YwiEQyEc+in4R4AM/0oJt5+NZaAj/lGGImiWYZ5L1ZTA2upjX0B
	LBgngZMMXZ4KkxwmNeSRoHW2usjt4nOm+5cUMenBxwAhjdeRd9xq
X-Google-Smtp-Source: AGHT+IFZ57Kh6ofjTHGWKo3b2N/ZqJNgB4wtTTZHGGPhENJZf1bEnfOrjTuJ9BzbHBw+JSngk4k3XA==
X-Received: by 2002:a17:907:1c9e:b0:a9a:188f:efd9 with SMTP id a640c23a62f3a-a9a69bad2a2mr1529801266b.29.1729620487109;
        Tue, 22 Oct 2024 11:08:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:e0:9854:5800:84ac:8ecf:df7e:7d6c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6255sm376856466b.19.2024.10.22.11.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 11:08:06 -0700 (PDT)
From: Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	arnd@arndb.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
Subject: [PATCH] Staging: gpib/common/gpib_os.c - Remove unnecessary OOM message
Date: Tue, 22 Oct 2024 21:06:20 +0300
Message-Id: <20241022180620.12429-1-m.omerfarukbulut@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

It duplicate the MM subsystem generic OOM message. This patch fixes the following checkpatch warning.

    WARNING: Possible unnecessary 'out of memory' message

Also, this patch itself might teach to module writers or readers that they have to give attention to MM subsystem
even they interest another one.

Signed-off-by: Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 6b12404efe7d..27654b2180a5 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2093,10 +2093,9 @@ void gpib_register_driver(gpib_interface_t *interface, struct module *provider_m
 	struct gpib_interface_list_struct *entry;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-	if (!entry) {
-		pr_err("gpib: failed register %s interface, out of memory\n", interface->name);
+	if (!entry) 
 		return;
-	}
+	
 	entry->interface = interface;
 	entry->module = provider_module;
 	list_add(&entry->list, &registered_drivers);
-- 
2.17.1

