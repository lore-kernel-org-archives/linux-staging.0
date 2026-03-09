Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8695219319
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 05:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773035155; cv=pass; b=RhpzPyAuWw5Y1JvjiSnIp84SjE4UW1G1/69RxhbcUq21T4EWW2Pen5kUnXctmbFh6DNshKKNaFuQluvUA+ujQHgubxfHcPD/lQrtk+MLMyQhUOSnhKDzJ0u4aDzWem2km/ZxRj4SzJEYFqdFza9zGMs+TVTqGDgf8muvd7WBnOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773035155; c=relaxed/simple;
	bh=E/A8W58sUFlSdh5aEau/MMaHKbtmucOQ7rTkWWaKc6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9mv+uIB6y5chEg8hKhr5+69Z7dseXyRQNhSikmwWsYtULOfYJMzhCuR7Z31ebO+Lzr4XGNCFURNtDKwPFGD9bLZCvqGf4TOTcRR5rtq2a9oKs+exVv1XkLqejIcuhXZfUpLdPLMNBIGRuaMThxAJdK+2vuw5d3A3vDmDBBPa/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0CwGw9r; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0CwGw9r"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64c28495b3dso1408623d50.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 22:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773035154; cv=none;
        d=google.com; s=arc-20240605;
        b=KRyD83RDAVT9eKwcNT6U2E+16Cr2hyf63z/TSgTlwuDUF32fLm64346fyePTOFDJRA
         tqC/b4BHmquKS/Ma9E/EeAAjOMV4UebUHcAJDVF3qO9Oob4/OtI3iz070F16EGFhfkCg
         224rK23GlZWQRFwQsbDz5E6l5v2BfoGOZ0LDaX3guFfv0U4qoFPHPEgeRswWAxg7rnDu
         pSRwOb3vq9GTVnZ+Ffxnp7dh6ivLr0ppBJwbfefqcu+RsnSG2D4DlGTwjjwnElKa3/Yi
         aQT8Zb9YM//kN8M8WSaQmo5JJqn3/9wdeiCPxBanQKzyW9ZQ+l9//u1wGVjTTz7tMRka
         TQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mzthL14/x8dV/aOENPu6Wy4eWd+65Lm3Fwqr+PQqG8Y=;
        fh=VNn23yoMWQC4K20KRXWf/JXU/HZ9TX8nyHpaIumiDaA=;
        b=eZkEQfOBwlDs5l1nIqRW8fXbZUAyMx8V3acJdEfvh6jj1iXGLvk+SdW1FOkb+x3DT+
         ZLVt5hJjY3CZSKNzBgFS/z49AZY4978g5LvdQzCZvGzE5XJT6g1ZU4Xe8Nc9bcH9/fV6
         FqZHx1Mu8DgfCiKKRw+pZgHPLEta+6pCd6DUBaX5xdcJ+8efBRaTkszc6xj6Axi/7Wvq
         nlEKRlYz9HTAv9RcaS2JQoDWAlu9D+X4NoDHwZLlBJLIumDGq95Ho4/WNimWpBO/14p/
         S6uyQBSfcq3uasMJE50NgoBEWMTsU+ZiMxOlaWgPjWU1RbWqKJsG/8QyUtZ7rtS8LQGT
         dHCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773035154; x=1773639954; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzthL14/x8dV/aOENPu6Wy4eWd+65Lm3Fwqr+PQqG8Y=;
        b=Y0CwGw9rUsn+29GCRmsWSnholgQQBuekE9vIrV9SH0+zefAKvOB3VOX/ruHpc1JJa6
         hs4cXsNNhm9SET5Pa47Il6llfNyn05KZ8fYUXJ39x0WHWTNImkGI/ChNJju6zIBIUpiN
         q/iMuSA8gDNWDAIW2H4K3WSe4mpEYB9W0CkTBPcDCpbCy1hQVZRIVrq1855Hzp3mMS0s
         sVTyGEM8qhsE++mhpdg8JFHiwT2FJCUYxPSlf8yKmWrmreTNCvBH0TnIsU20rvohVDad
         /Shyn7Jt5GvUbK22GLhamZgTAMP6uo5EwJ4CtbU/qBTV90FPwci6vO2eBZ40rYxPPkxR
         xjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773035154; x=1773639954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzthL14/x8dV/aOENPu6Wy4eWd+65Lm3Fwqr+PQqG8Y=;
        b=CF3yY/uDRLage6Om0T4uIDvk7hYA94EXzdD/l24TovDyIvEBp7nvTMnKnnX5Cnqe2l
         /Z7fJz+xxSjf62g3M6LLG9CpWeJKC/su1O6bkJDiXC7n0pNcbZRek7iUWeGXS5IvuPip
         YBQXRcycO3pv+jt17/Aa/EdTE2brNMYS52P48y1/aKVgsWwivbiUi1uItOnnioB89sVH
         YA2Fz53a4qT4Mdr77yxZEN/BDpJ7POXm4tVFxcf3FklV7g2w5VrSe+E583g/9iNKl5BH
         RG98pIXcDgZJuDWPe7LdjxjsQAlmjj5zk7cHPxBsXEBMdBUUYzky7gefX0Wm96ZDHDh/
         wfyg==
X-Forwarded-Encrypted: i=1; AJvYcCVklO6oak7hXtGcbJJCYbVZZ7DrwcADXjdlYE5yCvF7kZhfQJo8Wpr6JUR/mlQZo8htwP673gFm1PH07inl@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbb82ztCAOIvdVUhOzeFGq2hVmn9z9h75okt5fDGNLKAGoYdNF
	AAEaeXVokE/fMgZSGkcrJBQNr7g8pZUYRvgrRkTZD3BUX8XSXasGzf5MI56RcBSB7ZiB9xgOpzn
	x1g2M4W9ZkKg7WUBFmD2W7vjo4enuM+k=
X-Gm-Gg: ATEYQzw9QSAhACbN7ISSx3Lzsy+mnB2D094k+e6M2BJVLu8HtGA7+nFhZrAUl3bo+8s
	+I2uSiAxzKLjEOOgP1/abu6ySQXU9OcBgwMTtgMlCZrPlRT/pIT1bKRKLx9g8ose6xK0PkPEzRh
	AnqqFDJQeA1LVswtGk1M1jm0AJhvfqSoXrARJXyvX41vhbx1QNj76FR6QCrjk2kEhr0+tfBBi2u
	9YpIZrMShKKHuRBGoiiBUc+E71j81su2BwI5hGfj+46cnnJMamYfpjMWq9poz9OXCpoVUEMNzFF
	2M2pv+y3dbc2m58a/hHnTOptVpu0caS2Eq/ixoTnWLMTvqSlj19jnsbCEjXeA5vX4jXHvy6MRJh
	OBQE0sZPCXVAwok+6dVg5uw==
X-Received: by 2002:a05:690e:1289:b0:64c:d035:efc1 with SMTP id
 956f58d0204a3-64d1406282emr8861273d50.2.1773035153834; Sun, 08 Mar 2026
 22:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260307113959.67116-2-giorgitchankvetadze1997@gmail.com> <aaw3IuOQbzPcAvcS@stanley.mountain>
In-Reply-To: <aaw3IuOQbzPcAvcS@stanley.mountain>
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Date: Mon, 9 Mar 2026 09:45:43 +0400
X-Gm-Features: AaiRm52rCWk-qVe2Q82ZBCu5d7VVRz-TO3Igx7Efsu4guJl_ZAltyJnbsmctTII
Message-ID: <CAE7dp2oncz0u6njgYe0obk8=Xq9=jahb0X_HJ1gM4CMkn6S0pA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: circbuf: Fix leading space indentation
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 6:33=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:

> We would normally do it like this:
>
> bool ia_css_circbuf_increase_size(ia_css_circbuf_t *cb, unsigned int sz_d=
elta,
>                                   ia_css_circbuf_elem_t *elems)

Thanks for the review, Dan. Sent v2.
