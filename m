Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738682F8BC1
	for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013969; cv=none; b=CAk6LB3T1MCv4YLx10flFx1mimag8kKlnoC4erQKu/JGu6xr3zWpt8/K8bhQW/unLp0/Z/ikwJE5wcAcZEXDD45GL1w/hxDdfs3XhiK49YefzTorvqjtUmQemFdi787ISz8DaNZrpoSpv2gadj3MWIXRqxbYKilN8cqZ9VFMaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013969; c=relaxed/simple;
	bh=vvOHe9u+/zNDaZKxeW2eoRXHJCvHl2v5R/bFdM2LQis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SM3DRqBHF5oTz5v12ASKWi1aaZfyqrwSFV/cGeXRLADF/ZrHdNuvttR9+X3aP6/R6b4Z+5pPW5D86HJU98/DlH6bFBVr+VxkH9fvJJ81Y2P2E/uTt3lGbl6Gj/yk/AAUZ2E4vjMoTefpgYOIRibLr3ShU3jqFXbsjx3XQwdTJCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24306318aeeso5098395ad.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Aug 2025 08:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013968; x=1755618768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xhittB1Z3BFmPBedtymhQdJl4mLRLMPRy6NV0jWS1k=;
        b=bfsnydQEUfwThmizQZuxRmTfRvwkzeDND+WiG+xQNA7XfVJkSK0W/2OiceZmGhs9Ur
         8d5PZULpMOp+4W4+ZUGg4k5vGT187CC1DkzkXWJkqlrjEOnsHF4ZU79DtNysOXNUGb0z
         +0M/ubRw72fUb+YNCBLvnJ1HoGvdXXyS9GXlZltzQfbkO64MoMyFRQ+nwrDj4MVo6ruI
         XUIE2umjUwtJv53neNKgT+Sc22L7OUXxETroVyZKdqb9m6CBesXE99b3lfSVn42tyc25
         rDyqymZcu+4BwYcZovuxbkSNijEtTlyQ/tw0EJKErGPHLUSRllmDzXbOfxID90/D3Rkc
         UwpA==
X-Forwarded-Encrypted: i=1; AJvYcCVSY+b/Ppcicn9khWLb7b9Z07zOYjfWVDbJZZE9cmJbNZC2rrXnViL+q9/fopyvRzGNCCYYZEtDUmBKlQss@lists.linux.dev
X-Gm-Message-State: AOJu0YxgyyVmEsWESFmiGT3aTPFifY3zh63Wtu/49HTqf1+AYr07qNSd
	KGYjd5tJfdbl5RhnKwKNldTbJ3tmdL6i/QII4eQSjrOREVRQCa1/ytE=
X-Gm-Gg: ASbGncvq+XBSoYLS4tFVlu/+0jbyHcWOjmXP/wOQz0LZOTCcBLdOrjMkG3PkM4B8QKO
	V+D36S4DmYRO8h2JsgHMe4fd5JntNbpte0r71Bdlzit4LhFAz01+HGpFeOCfnctUJVpCPxmw+oj
	sYIYZPQWDBSSgmvaHuGBZ5WWng9HWt+gfA3sTW/BESvvlfDwyhSbCntaWOVFT7jtkZjtXM46swV
	Fvlk1dwydD7WVf7tqmcIV4fh2GvzGEbHGhFMiewgZuoDJQZNLeEisMZSensQfXCX9Lk54m60LY9
	KSK+Oje+IQnf7NWb6DCpAS3M6iGSH3wYExVdQ4zZlckox51nI7FDaXl7bXKwMb3jwrd3TQGMYf3
	bktTQiohHPHOzpcHoguBe4XTC7QDIT5zvHwx651P+K/Wx5PLJADDg1S+ZLeo=
X-Google-Smtp-Source: AGHT+IFoG9C56EZHwN/MxrzFFA3UJZXB7gFcizSUrt7Y/XjCXBdEhjPeu8ZIdfLSs1+cGeiDc4xfCg==
X-Received: by 2002:a17:903:1aac:b0:243:3da:17bb with SMTP id d9443c01a7336-2430c10d63fmr3177625ad.32.1755013967516;
        Tue, 12 Aug 2025 08:52:47 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e899b4adsm304377985ad.132.2025.08.12.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:52:47 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ayush.sawal@chelsio.com,
	andrew+netdev@lunn.ch,
	gregkh@linuxfoundation.org,
	horms@kernel.org,
	dsahern@kernel.org,
	pablo@netfilter.org,
	kadlec@netfilter.org,
	steffen.klassert@secunet.com,
	sdf@fomichev.me,
	mhal@rbox.co,
	abhishektamboli9@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	herbert@gondor.apana.org.au
Subject: [PATCH net-next 1/7] net: Add skb_dst_reset and skb_dst_restore
Date: Tue, 12 Aug 2025 08:52:39 -0700
Message-ID: <20250812155245.507012-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812155245.507012-1-sdf@fomichev.me>
References: <20250812155245.507012-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Going forward skb_dst_set will assert that skb dst_entry
is empty during skb_dst_set to prevent potential leaks. There
are few places that still manually manage dst_entry not using
the helpers. Convert them to the following new helpers:
- skb_dst_reset that resets dst_entry and returns previous dst_entry
  value
- skb_dst_restore that restores dst_entry previously reset via skb_dst_restore

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/linux/skbuff.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 14b923ddb6df..8240e0826204 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1159,6 +1159,37 @@ static inline struct dst_entry *skb_dst(const struct sk_buff *skb)
 	return (struct dst_entry *)(skb->_skb_refdst & SKB_DST_PTRMASK);
 }
 
+/**
+ * skb_dst_reset() - return current dst_entry value and clear it
+ * @skb: buffer
+ *
+ * Resets skb dst_entry without adjusting its reference count. Useful in
+ * cases where dst_entry needs to be temporarily reset and restored.
+ * Note that the returned value cannot be used directly because it
+ * might contain SKB_DST_NOREF bit.
+ *
+ * When in doubt, prefer skb_dst_drop() over skb_dst_reset() to correctly
+ * handle dst_entry reference counting.
+ *
+ * Returns: original skb dst_entry.
+ */
+static inline unsigned long skb_dst_reset(struct sk_buff *skb)
+{
+	unsigned long refdst = skb->_skb_refdst;
+
+	skb->_skb_refdst = 0;
+	return refdst;
+}
+
+/**
+ * skb_dst_restore() - restore skb dst_entry saved via skb_dst_reset
+ * @skb: buffer
+ */
+static inline void skb_dst_restore(struct sk_buff *skb, unsigned long refdst)
+{
+	skb->_skb_refdst = refdst;
+}
+
 /**
  * skb_dst_set - sets skb dst
  * @skb: buffer
-- 
2.50.1

