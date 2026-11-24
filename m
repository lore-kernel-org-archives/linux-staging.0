Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557118;
	b=CDJwxdkkV30kbDOGwjmbjzZjUEfxodUTJ/t2Db+/nbt9aCVIUHwaQALh4v/ENaRSgexW
	 k37vcpsX19khK49GjjaMdmQj72hUKMTEBwozQDOyX1sA46vMdw4ekN3pYGVbXQLyR2P5u
	 TJamI2M+XzKkc7fwO7BjP/rIdlGg+JjBYdKZdhHsBYsH1qEXP174rzOAWf5P+k4asZlnJ
	 EzcYysnk+LPHTdMa2zBSpP352nki4zD9mMPMzJmBr2bxDOQebSQ7KLvXSwBLwadSo0FuZ
	 ARcydOR+scqxqMPJfHbiUt9dd5lsoycnRHcYeTiCmONCa5vhlT/tBVjW/1njG3aqKNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=m0dxOe8vy7ZKObR4eQwVjJK4jXbzDOG/YuLGrV68Qbw=;
	b=lJ/c0HhcirX8TsZnALXvoCDVUpTtBUjs6RSV2J/0z9ZYTqm3SECIKD92K8+Cy7nBR2zz
	 v1YeuHLXPpbGRRD8ljIq5mnby0MjKaUBJpUBrDESlXVlbkuzG48HHn1wQKGjemLuFofYb
	 zppUHNr9Z84IE4Rzoc9L9J0qQP88gNbUznXS09BN3dWRAUKgSQ8kLsRe9DbHWQ91sfG1p
	 0EM3ht9ATWTe7KhpDcRFwLqjOIkHyj+lOe+UGyu8wO3zx8FS5JB4Pf70RZ0KBKwWDrO+F
	 LfFbndIlXFish5eSsqWJN/adLkOTFbrXVSvwfujgMa+GQdti/UJGH9bKgg+Qis7lKag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=IRSbVmLs;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032C606A33E
	for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 21:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B032C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=IRSbVmLs
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so7247362c88.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 13:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795557117; x=1796161917; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0dxOe8vy7ZKObR4eQwVjJK4jXbzDOG/YuLGrV68Qbw=;
        b=IRSbVmLsz2Yhc9y3BfYM9o76FJVKMSRrk0ilAw5ZD7E2U5sBc4S+soth1Wsc3Jt+e7
         8pb/C+zmbmgUGeHpNDJzqmtI0ojhe5+mGRuB5njg+D3sUcEil2hvLApMrjf/A4a84T0A
         0Ubmzppp9o4rKAKaJLW+73CRkVWN6XjUQaNVqP6xZhbU5yFRCg7YkgQnyaPE3HVZJu2o
         vrFm+rRHpn6vzI5cX4BV03bT/Yyz7DCCVEM87Qcf42oJYYIcEqocALHUUvFrJiELQWzQ
         Puw7G1mHAI3Csgkyjl56AZyKylmszb+jdrHuCEvdSTYrN6qxk7kCi8yyX6PH0TCeVY0C
         fvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557117; x=1796161917;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0dxOe8vy7ZKObR4eQwVjJK4jXbzDOG/YuLGrV68Qbw=;
        b=Wx0voU8hwuHw+SfwZbDb4coSu+CiHAXLnffhSY4SNwAgUmI3T/fddrFlrFPAGlS2Jn
         mvv8Uv+8Ebd/gyyaqmYnL2C/Kj/jRcBH5lzWHNnOICJ6AQCd+oepKUFJHpcDV1L37Qxb
         7UacIphLQtP4wGC+95D4vYD+n9YN4+bXfMHR6jwtoYG1bbX22PvrSVu3ED4KoeakI+Mh
         HgZn4WKYuYl4xvrVpgppaU/HIyWTBERo/tdcINhg98f/Ky7NZ6atuh2U62BFc6p8B0fF
         8Ub2ceARzqx8I380ExMiFoPuiKsikcRokX0azOSFmkL0NnYUu3ACXf7zWHCJ9NPt+HNc
         +NmQ==
X-Forwarded-Encrypted: i=1; AL+hErGV0T7u8BPzzRlCVGrIWYAzPE94x+KQ4G//YBJbhpGJRgU416gTc2ahc2Cdhhgyz/ORjHzKPAIqxI4z//k+@lists.linux.dev
X-Gm-Message-State: APuU4Z9rmeM93OnL+zKBEZXxWplkWJCXKKIH9op0Hl0ZySyykAgAcuv5
	40LkDyztUkFfYtKlpUoRO/hy0t3nzrKMpj3dUPH1Jb7Wc/Go4bOAFPoXwC0ipQbNJwI=
X-Gm-Gg: AZFdTZfBndXG2DZq0Qx4NmaeFvDTOa293kHV2ZM5Kh69H1FSGNdjmo7kTjSwWq11UMh
	xFnZSORw6RDe5Vysq74QxdiTCqPsixnMYBxormEnLCOYNsu9mgjZwxFNNZh8gy5Xs3HJnniQviD
	OdH3QDSGvsqD0iXuBnzDSW8Sp34E8TWgJzG8He9gX6pjqClZxmhC+1JC3Y42oWYSfhEHqxPTk86
	+rMArP/gZsIPVoHP4IT59LLlXdIrwcsOntMZS+bmOT/6oTRXmHZN4virM4dtfZj1uacelbx7wMD
	L8+tiar995s7nKo6webJrrS+ywZxUNA5/idlF4hcTgu1GsZ82z2nR2wA50CMBli89akSNn+mBa0
	CPeKAkTZA+yLSr09mqK/FO3eLv//XsG43pT9VuSIXZHeIqDbcWvEIz5Zgcc9iu16RFxAry1SxnL
	FRjiX8AYTGzREXfzJCaTI6isXIztFKLYSGOEo48ClJLlih8J5PBxP+/H9xkH9n83h7MNcxyqQuk
	li/7X4Bs51Kwk1a/4b66PfltO5TCYlbywaw0GWnB58q6Qe9IyR5gVVufJwGeZRkQxcHUKq0+CtK
	hn5xjPdHTB4ocmdvjB9xCBMK8SRZbf7qA60KoVS4B4Win+sNZy5KP36KKmxGH9YC8ILO1C3RQSi
	F/akeKS5oWjIOiCG0tmBDyRFsrryQ5VYw3zf2LCG5tXLzJUk=
X-Received: by 2002:a05:7023:b18:b0:168:3243:c937 with SMTP id a92af1059eb24-1b5568bcb9amr19336582c88.16.1795557116769;
        Tue, 24 Nov 2026 13:51:56 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm41362637c88.6.2026.11.24.13.51.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 13:51:56 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: damien.riegel@silabs.com,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-staging@lists.linux.dev
Subject: [6.18.y] Please pick greybus raw write-after-disconnect fix
Date: Tue, 24 Nov 2026 16:51:37 -0500
Message-ID: <20261124215137.40304-1-artem@trailofbits.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Please pick commit 84265cbd96b97058ef67e3f8be3933667a000835 ("greybus: raw:
fix use-after-free if write is called after disconnect") for 6.18.y. It
fixes CVE-2026-53024.

An open raw character device can outlive its Greybus connection. In 6.18.y,
raw_write() can still pass the destroyed connection to gb_operation_sync()
after disconnect. The fix serializes writes with disconnect and returns
-ENODEV for writes issued after disconnect.

The fix is in 6.1.191, 6.6.160, 6.12.114 and 7.0.10, and in mainline since
7.1. 6.18.y received only its companion, upstream commit 983cc2c7efbc
("greybus: raw: fix use-after-free on cdev close"), in 6.18.57; this fix
needs that commit for context and did not apply to 6.18.56. It applies
unchanged since 6.18.57, including on 6.18.65.

Compiled drivers/staging/greybus/raw.o on 6.18.64 from a cumulative x86_64
tree using allmodconfig. No kernel boot or runtime test was performed.

An LLM was used to check applicability and stable-queue history and to
draft this request; I reviewed the result.

Thanks,
Artem Dinaburg
