Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E2346E68
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364514; cv=none; b=fCtrxafStQO+nspLNceewWztbMAtpenfL4CSYxs0+qfoBGqoJkcNeESe+UmnKSh/kZpf/QyzjQzrQdLhziQgfcQeE3M0w3QENHRbjFzgBaLGa8EsGdU20UIFtAn61t4I39a4nFJ9qxx2+pUVz7J9dVf2MUiJIVukXBzr3RxkaJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364514; c=relaxed/simple;
	bh=U6tXGsDMaiPPT0EpneUhvBXryd5XFjQuo9OfzZS7qk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJWeYAFsPrmcBnifIHUjnkBhoW7FFySh1rWJIQBPsOMKiBmfRQoovUHJkddJFs0IMjO5kzYQqOtGjDfvehVfwXFX3sgNQUxMNjlzVgh96RiAD9nOEdo8G51RF+01aa5HtuIZwTkqQ64CDY4EMzCArTJMQCTS/PyHJ78zDfr52eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HijROHSF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HijROHSF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so1881756f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364513; x=1770969313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCKgyqzsp726x5p7+fnyesGWngCXQiLyokgJQ8o2qiA=;
        b=HijROHSFSsFdfmAzyyfm91oZuhpfKzzRy67MfOxeE+4gGgTPjK9+C8MPJeqxagH1nS
         CLmhoHm0mKtY+/AZYV8FNtOcGsX5Nzr8T+SgASusGZPCfMBqEg0U4ROJbKESaVd4zp2w
         Bm6mfxzEjlxanO8eODeRbsgkvXOPvFitHkYusRUWhOSkmKEhWl4tcfNpCTNBJYBU3Bu9
         8yjeZx0ztHfrGHOQISshCB1ifNTGoZQLqJ1TAyR1IRzLfSW7NyhWIq2eFAgK+t2tjkup
         NVySffzERrVE6U/Gqf3s9Ccj/q5FmbuMwlxv/Xi8w8O4YAgtUcZs/Q0H8szkm5FLMW2K
         9l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364513; x=1770969313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bCKgyqzsp726x5p7+fnyesGWngCXQiLyokgJQ8o2qiA=;
        b=VhpDMzSzMf7psmqtNmORXQTi43GiQxJG+TgO9uwQtkCsJ3jlhzt6hH92+kz7HSBKXR
         +jXO3jGsUgShMddbCENyrFz81wyJlYiyzF7m/sDzK8WDFySC6IRfR7HDzFRRvf3HG8kr
         ybc77k2lFlFDumfjG0Ok89PfDbplUcW2mGMtz0Yoa5wOORJzURa/b2fBuZ0YT3MQIGTP
         vhdVOM9OFS9gBQJOZDhFKWPzFGsXNGbmW8ngwow2aomPwx1xTBoGSqNd6iDK2tF9+ct6
         FUMqfbBgo+W54OpXNOwclfagmdKj/wEeNdMqWrHdu5cIJJBgRS535137jTh5VZJLlbaR
         0tgA==
X-Forwarded-Encrypted: i=1; AJvYcCWoNWzgYsNd+NPbwldYR0a4MzYuskyG68b9EsbhpLjtka8Rra+LgDVh30POpCIu6mVbSOmtFeS+jLsjyXab@lists.linux.dev
X-Gm-Message-State: AOJu0YwyAyrFeVUJf4rrOt4m9oC+e67qFZ4x+Njxa17bVWU97O6+WC0o
	n23XdpK6sLHpiWZ8SMjjRiud6LQlqFG64vurTPgmUTLQRAvVoSfFtrs=
X-Gm-Gg: AZuq6aLLagYXYFzU1gChHrgO0HN0VGJ+fP//gVJt/TrG8FcnLMD4lGC/hGCdv2/hhVm
	0XmZdN7lLgxs/+BPzefj2R85co2NUL6XSqi7XroTR+AiVYac0+UKuWA3o9MasYM+dIlKdPhmDAV
	rvXyuFhAVF/WVIfLLi1ntRXOjy+NKrKngVdkKDWtP2v7YEwW97eieh1u/PNivhNoVhhYfMqrAFy
	A2NbSahXodGDWkREuuvwNPSfsi07zCnw4lLmRTYcV376jOj0zY+Sk4gxcS27mJJ9138KejYjn6R
	Y7qtfHrsuvXEXaFIpbd7rZzwLBxuK2ePo81dWXnVa/6xzTJBENT788MIVstZOmw/4jIPbaVbSaO
	zgaURjUzanM6eGSBLc1MCXfH59X4TE88LhCEXktZrrH4hogWpJV3NfHt5Q6VTP8KSNlrIt+zi/n
	YzUpHtSyFDJNjiwcp7ov33ESYVy0J+gBOpBZKV1bfX58f0vCaujBh6hpdNDXR5cMQ=
X-Received: by 2002:a05:6000:288b:b0:435:e493:25f with SMTP id ffacd0b85a97d-436293818d5mr2517803f8f.34.1770364512934;
        Thu, 05 Feb 2026 23:55:12 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:12 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 11/26] staging: rtl8723bs: remove redundant MAC_ARG macro
Date: Fri,  6 Feb 2026 08:54:24 +0100
Message-ID: <20260206075439.103287-12-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

The driver already uses the kernel's %pM format specifier for printing
MAC addresses. The MAC_ARG() macro was a no-op that simply returned its
argument, making it redundant when used with %pM.
This addresses TODO item: find codes that can use %pM formatting.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 0f28c904a714..8ae6fa6dd63e 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -506,7 +506,6 @@ Total: 28-2340 bytes
 
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
-#define IP_ARG(x) (x)
 
 static inline int is_multicast_mac_addr(const u8 *addr)
 {
-- 
2.52.0

