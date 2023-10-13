Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE60E31A66;
	Fri, 13 Oct 2023 23:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg0jU/G6"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so849747b3a.1;
        Fri, 13 Oct 2023 16:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697240859; x=1697845659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTNR+WS914Vji3aQakd2kNaBruSlecf8tdbR1KSMoAo=;
        b=kg0jU/G62vhkhp8sxuhbCzfLr2MF8A0uIwVzpVJbx69cp/n5CJqWV/+En9PabonsMa
         wLJg1ZxZCXRgQbfSIa6v+EKCHvmzeMb/L4zHHmb608pwqKjaAxG8zPn5xzWWNZpe3tvV
         lZ9ATnlYg/3ib/i+ai8Pp8RvZIm9Pc7mRTR+eA1nvNZHUS695DYIXjdwnNXTY6qAVbrq
         x9M/2JhPb6HaN5nrgFyttpLXQnp+bPzlgQiGrMN7C0hxSOa8HI33zPNB68LfWg44yI7+
         VIo41RRAWNZBMt4+rioKUa15llxUdJoIakJbaowQ/iXeJiX//iLzspakA94REW273udJ
         uQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697240859; x=1697845659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTNR+WS914Vji3aQakd2kNaBruSlecf8tdbR1KSMoAo=;
        b=FzxQvvbNl4e78ao4gtS0QHQl7fGX1AE15bw6mad56seP401G+JjXwxSJZas8YugJhf
         81WPogXbkXR8rW/MR5WjFZgB1mUd0IbUJ6Hypddz37R6ZAiBxHHNzRXdk3JzTwk+cug5
         DYUsdQuZv3QCBiEVAnBpSD7NFYt7ZEyycqIEviVe9dZKmtEYbeDf+tdtpd1xJv96ejv+
         ly7H3M5dR/zqFKQ2NFQQa+zFRy9WtN8wTiNQZAa36gLQp1O3jQlXUC5kQ/ykXnDqvP4t
         70SwPhmjvye6IM76S7JqgVCMy3BoyddV9l7foKrSx539HmhDM17NsT90uYjmzAc5swET
         F0HA==
X-Gm-Message-State: AOJu0Yz5NNWsqorxp7r1J22iMckj0eb9E18URgQgA8JgQbh1TdvDF2To
	4kZM116EYa0Vr1Rwe0ATkOs=
X-Google-Smtp-Source: AGHT+IGWGPF7YLEtx0WelXz4wF5QFqi6DXSq4StYn8DrWTIIvYtYAQ5UsSU2sTES3Jvw3RePX9jg4Q==
X-Received: by 2002:a05:6a20:7d86:b0:15e:d84:1c66 with SMTP id v6-20020a056a207d8600b0015e0d841c66mr32466718pzj.52.1697240859019;
        Fri, 13 Oct 2023 16:47:39 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id e19-20020a170902f1d300b001bb750189desm4411615plc.255.2023.10.13.16.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 16:47:38 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 3/4] staging: vme_user: Add spaces around '*'
Date: Fri, 13 Oct 2023 16:47:15 -0700
Message-ID: <81181dcc1ffa648f32cbe3c4ec8731e66349e450.1697240381.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697240381.git.soumya.negi97@gmail.com>
References: <cover.1697240381.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add space around * operator to adhere to Linux coding style. Issue found
by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/vme_user/vme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index faa9816046a9..fbcbd0204453 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -87,7 +87,7 @@ extern struct bus_type vme_bus_type;
 #define VME_NUM_STATUSID	256
 
 /* VME_MAX_BRIDGES comes from the type of vme_bus_numbers */
-#define VME_MAX_BRIDGES		(sizeof(unsigned int)*8)
+#define VME_MAX_BRIDGES		(sizeof(unsigned int) * 8)
 #define VME_MAX_SLOTS		32
 
 #define VME_SLOT_CURRENT	-1
-- 
2.42.0

