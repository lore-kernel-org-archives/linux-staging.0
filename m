Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181958;
	b=BkEbcUgcSIOSwAQnECnZuSKo/txJNvAlfdrkPyQqeS9KcCgL3/0qhIKthsNCtPv1d0yR
	 kHnWKkxPySloNW87sMIbwF//WBWIP1jTez7ZxqJlMmtBIyOCdOR0BNF4Ylftb6Spp60QU
	 sDSop2cmq9mMyS2XInh8HSEAID+DyNz3OkPt5wQsA6D68ndoaLOJZTRvIWaUavKeBCtyb
	 M60i/ol5LsryBC5+/0rDGJyZaEezNhJYR5Zo+vhzn3G6P/2lKjEUaRTToroUOdB/pILwU
	 ey8A5ZjTM/2fXN9R4YV3vtGse9QZPjH3/TlsxNgEcAehVziBURHFNDJ9LZovDRQjDGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iOrB8ZBemxu8yPvkvxyPd5fTfr0XdnHBAfznsD9q6Zw=;
	b=osJAIqKYw3Q4fBO6W59z5JQFW6vzH3qDStuVV6UOssopMIScjuV4YdQ7tRS8hHgT2u/5
	 yAZBjCMU1J6Jn2B3+fqoQcH7rkSVQA2ThIfmWsMfv6wTjQM/bjc3VXHqqJl9Esq9+U2HX
	 t5vdcPanMk5wZTKnopT6yE9QS8RUv2PxcBiT2oaU9J/uQ5nch3OnYwTLhtwc1Cu/ls/1R
	 bJAKo1LUBsrvHESC58Eq2whiuZm0TC4PQ5MpcL/D46H9Zin1XcLACvnTxQOE8u6o4mFkb
	 XoSFdwRVBqv0hSNo2PJ0yXQqIdnEiypHycYx+cqomY4nJ6BQz8+nhpzznpmodgBAr+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WaCTNPqB;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB347606A325
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 13:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB347606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WaCTNPqB
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40312e2so648094eec.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 05:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181957; x=1795786757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOrB8ZBemxu8yPvkvxyPd5fTfr0XdnHBAfznsD9q6Zw=;
        b=WaCTNPqBiYSmzcG7doBg4SlqEo4P2PJmSqHt5sRKSL5DOfLPlBVja7UhEJr4dAs+3e
         uY41ofS7cBv326hWAKLyXjXh+ns037bokFOWxRR3SZ1YBU8CzZ+wem4AYbLz2WiEMGWh
         V69AOZOQFK5GAT+n4K1kJv9VVy3DMfONcPOi5mF0l5YyFKvm9ETBcPo8TeJ8npXmAuPF
         yQHQlzlDER35Pc5rfIDjjUEFeYrFuIgydpvpz1zyPpNa67yAgbtjxGGdJmTRcCHVZokm
         nA3RvzOdsBBuz4uNh6JCG60IKZGvV+2Rie04yhG9MSFXWDiKk0H79vzWvOaDh50CmxLN
         +KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181957; x=1795786757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOrB8ZBemxu8yPvkvxyPd5fTfr0XdnHBAfznsD9q6Zw=;
        b=HnEhlc8706Bb0Sht9UvK1wUMab7ygqwHvNFYVsT3ibiuGpqJd5+uo+RPF6FMHEWAIv
         qG9cl9lPPLAVgDoNTXYPtYsx166AJMZzQLiHtb2bchL1a5CPos8Rh7dhvkS2cSXTclb0
         X4Jh0yp6vtsgv3Fo0yVhS6okKeeDQCaBn3Y3iiP8eo0CugINeWk/qQpshy8Unn9uOnWW
         F1ND6SMppPUDTBufEnjFuoZ82+acBTtxi26t+MY8TP0U6g+OSxu/VjryggwHddZDgmny
         44s3C2EyEu0UcxwFAXmjCT/I/95C3LIDWSk5EK1cxB1ALHO1T8d9HVoL2GfDZ8JbuFff
         bvgg==
X-Forwarded-Encrypted: i=1; AL+hErHLnuLq72vHper/xBhjS+dbEAS/CkYSFiboZXRwe7dp56ZPUFXeRqNGDXOj+sIt0OMWzOzbdbaHfUhUJA9p@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZneY1p/IxJrF6AAkI0buTITQdw+S5Ki5GLqn0RH9W8Bu00IBr
	iMaJMxOhwAVFqdmso4HIfqLnAbN0K58TZNIt8BZnI1Eik8q8GjsI9NmR
X-Gm-Gg: AZFdTZdN5NBOzDF0WILerym/uZddfcjfbzqRZ+7PLmDuMKGg/5HpktRAWquSqqWiT+h
	IpbHZmnyY8fjSXRoh8Yg8/FBp+KyYOnf+JGYYfDv58lzJqRYrURKqnWsNmKk26SSKOAM+4/wrfx
	28fEXcTI0WygPTH2haQFn1bEkvdFcA1EllrZUxIgMPLDzhQtOcXFRkblbaHU5IYfhQurZtCfYzC
	ie8FLTr0uQ7l1eLUoQCufSVrlzqAovNsGdlXVLbmzaq3B8j0kL9Gn3SN9KXIRfUc3RijOu2FCuS
	kLH8p1B+9eiKtD+BrcLy1CotXCf/q8G3gtgxpoBNJ1QvE2hbUWnKy6ytZh6/BhJkXNeLwK8l86i
	YrQlYvKBsmEO7Dj2JJwNit22e0lLwUjN3sDBrMWysb6YqBl7KwImTH2167QnDnmfll9/kg5fiiR
	BQiWJLRH0xSsy9U1rGaGZaQeJcsdx7GUp6etX27sxjZm6Sf7UVxU6AWBOJCivriiI1J+IywilWE
	oSTpvwL5lGqrX3TDkyI4T3o5qaKaruysoa8nWQd+wlMPiqDeOZ4MMygCw1shf3nF8Xyf57E/2WA
	v46opDJqz2Wby5+w0Fnqlc5/ZExNFX3YtBmfkECIhk2gaDyMTnj6icBZIK7ea7b9JseYbhqePKc
	Rez02hEuMWg==
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr105006eec.7.1795181956894;
        Fri, 20 Nov 2026 05:39:16 -0800 (PST)
Received: from tarun-lywait.mydebianvm ([49.205.203.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm8673442eec.6.2026.11.20.05.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:39:16 -0800 (PST)
From: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
To: tarun.k.lywait@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: octeon: Align function parameters
Date: Fri, 20 Nov 2026 19:09:05 +0530
Message-ID: <20261120133905.2146-1-tarun.k.lywait@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAPmeTTDDU3vQ7rzW9qVtruu5_RA3WNm3OQYsUB=+U3HMaQJfTg@mail.gmail.com>
References: <CAPmeTTDDU3vQ7rzW9qVtruu5_RA3WNm3OQYsUB=+U3HMaQJfTg@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the function parameters to the open paranthesis and change the
parameter "pko_command" to "pko_cmd", so that it doesn't exceed Col 100.

Issue reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e..cc1204e20 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1387,8 +1387,10 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 { }
 
 static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
-		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
+							       u64 queue,
+							       union cvmx_pko_command_word0 pko_cmd,
+							       union cvmx_buf_ptr packet,
+							       enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.47.3

