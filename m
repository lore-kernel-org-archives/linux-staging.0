Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161191B582
	for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 22:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkiKZCzP"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e741123acso11113190e87.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 14:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705356336; x=1705961136; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lsDoMa/yXIw/N3voDTw3EBx0FIC9K99qzVip2lisby0=;
        b=jkiKZCzPdfZv5XZw9gaLw0QWT+Qf1k9U7xXLB818gi0/U6RpUmAd/dTxUshbTu9neH
         zi+tEqo4Tg0ZxLACIp0IdlgXmvySswqUYiPb2Iyxp+9hAoJDb4/OZpdU+eVoEviTIV+j
         +EtDmwqxQlET9hBS1mvKHWxEv9jEYY6gbe7V4jOlq+IuQnNZUW5AArOMKanB2GDtr6n8
         Aj/YtIS8rO3ZUu/jVJvUNaNz/LtReo3hiUQBsel1qIM8nGmvlLGeS26Fiu0roXjXM8Jf
         IcHwdReqjT1NDcfvtVIRo90ICrPUFYNiyT4txhGVhI3vd6twl8vCb0oPBQrx7dY4oRwR
         md4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705356336; x=1705961136;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsDoMa/yXIw/N3voDTw3EBx0FIC9K99qzVip2lisby0=;
        b=p+sZDpU+E9uXzSFSTdUP0u99UMIHjMLVXtSesh2/XA3n/LRriWCx41hBGPavgIovkU
         Vt3F4m4YoYrQ6Ayoy5yPZTGJlmb8Vg/snGhJoL2n+WNi20d+cBn1SajlndOcyLEOBe34
         ZP1jd7Cho/FEt5OKhZtwC1/K/+f4qt8ZI9EKvfRywa7BZRs9wTmSwaGyfSuWr4N3xxJ9
         Oq9/NyJMaivIspiiP55CXLWlT4xwUxlQ+2RYyXyoK5mJM6yOLcWEs7rAawJDBRRuwI8c
         sJ11gasobkDTCC1F92Bp5VmqH1XcW2csTZ2pDJlO5Sv7H1B9xa79vslroNyV1fn10eBt
         6ecA==
X-Gm-Message-State: AOJu0YyQUAhCtX4ri3bjCRIFUYuaflN2pCeifmodx8E2f22zSkv56EeZ
	Ntgzg44mg6W53LXC9wqctTlywuXW5Zg3RDNlYnI12haRoZw=
X-Google-Smtp-Source: AGHT+IEqqGzNuFJUy44Zw0oWJpacB9+GXMXrEJMjn2asUp3ettpL8M2mi/Mb0KhMGX3gLNPGoeJ8ngmUPAlI6vTlBxE=
X-Received: by 2002:ac2:43ac:0:b0:50e:b19c:94d7 with SMTP id
 t12-20020ac243ac000000b0050eb19c94d7mr2483225lfl.106.1705356335624; Mon, 15
 Jan 2024 14:05:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: meir elisha <meir6264@gmail.com>
Date: Tue, 16 Jan 2024 00:05:24 +0200
Message-ID: <CAHdEp88L3ZqoYBY9UBXx3jZtJxBX=ynbiu2t_hRR772gDv8qNA@mail.gmail.com>
Subject: 
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

subscribe linux-staging
