Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC942226CF6
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 04:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777263369; cv=none; b=MXCFhgONQGDYJ+WEXuHJ6qHo8ecjKlM5Dv7ynV9atq2fRx6rT813E0tatRx9zZerY/baEPdUN5SO7kUUFsjVVyzauDjz+R/jY/Hrq/zklUZAD8qEi2bfXccD8pquG1rg/AzyIojTfR029pZFv/3Fg6ilEbdicbOvUmLAp3RCJZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777263369; c=relaxed/simple;
	bh=JpMtl7hbhulzV3nwZu9W/pbsSbxH1L+bdiYDdJ6ND2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EG0SXDL7D7MV7NHw+6r+WpUk4hVemW+CDxT6/VjfEfnsGu7d/yF+p4t0giF7tqcHL6pEiQD7+6+szFPl1KrogPwY9Jup5qKN7Ny7VAfJiDGPODIZ1WnP9Cfd6Gxzy2aAfAHcE/vESago1mWOFMttwp3HF25pydGoy6+rygel2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3T6slFg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3T6slFg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3591cc98871so4435364a91.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 21:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777263368; x=1777868168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBVsMfFl0yEAUw1ZjN5+lI+UR2Jh/4TxSk7il6f/7BY=;
        b=e3T6slFgpuyU+TPip1Xk8ohGDlQBzlFgbCNQQJwYvjSLcbVdEFcfCcx5zeD8Vfbvce
         Zq8BY9oJbjpJjHe9KPmWZUUpeE0eO+RgGL931/Hox6YJsiktIN8q56b6yihkMzRjgrk0
         nY5klXJ+3s+zQN+pajMVtx6tKiP6LXhiEvTZ7JSbirx3X0O4iqcqI5S6vHLMbt1Xvel7
         Vo1rWfsuHwRCohEMP84I2sBAT1SaVm8e985KMgLd9NJLK2WGslbVTD3Nugbn8wIAYQR7
         hDLK33gpo6EkVULEXAeDZSPIClmKiyzKqP/vGOr895Iedxv7NYTDQRw7qGOBMtq6TVnf
         GI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777263368; x=1777868168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBVsMfFl0yEAUw1ZjN5+lI+UR2Jh/4TxSk7il6f/7BY=;
        b=d8LkvF938dCi+1YQi5eTrZyuw4XdKeur8o7+oM56Bz/41GAB03zTG7PbzfBF8OzhBr
         KFTC8mWetATZ4+/FzVBu6RV2O/fqhxbLP1jRs3lugmjKb8jpyWh/r0qrntEclzHp08P8
         YJqCWLIdBkyJQ2n5xGVLky+XgTO/Imb8NKMG7v9YnM7RfzEasmcP1XBRLbX4PD95tCsY
         g/urRFgAi2mhF0fUv9W+QSwRoBp2JxJA7a3Wy6tT306dD0u31S0GWvkJ5QZ7/X7gJSDj
         tOrOslYd0L4qayDaaHO/TMIWZuJiTlUSbpTtWRH/tZt8Y1oPTHrA3xBUQFxpRSZUrV6E
         4t8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6+CaE37QsscMRk0thBeb0Li1G+hUfvctvbmO+QlNvMtNhy0g4n2QYhvdQNfK0keUAGM7G9VYjbOQrWO9p@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3H/NMQxtTf4g2yc03hqzTwewCWkHeHKwjMldI6WTEQ6YEhL8D
	ZoHvbbM+iYZFKWJef0azTHXVLYQKiQjtTY4b2Mea8FNsyuYBcml+aCx3
X-Gm-Gg: AeBDietH/bclLT1q88QWE2J+7NRA0ifO/Egt3IDXwwLE7kmE3X7fW/I+0ofECJLLYaX
	r2yEjSLpju5Q+OVv5ZapZkAt018G19BPQ4hM4jTH5CSrZf+pcQPnVUF4VAMTRP0kWHIjfYNC8jo
	WUfkT7BOcLJT75Cv5Cs0V46J3NQAdVzEHIMuNraV96KdqSjvXlkOcHNFsobV+9+vRSgFRJm74bG
	vxtTAJMm5vc/8236xJN6sQgJ8xNT3p6G+nyV9nLaZc3yr6zvM8tF+oMoEUuhKnDLMfswUgbkJAi
	9m0zKSIMnPLuZcRDbYBroPZBr3A21B8t5qC1BYlrBlLIOQUwpw2EwtCFujDPbnyEG+nmofrxSvO
	Hnrr7zXKP0oQWABuepaFbMCLOhchIs8XhSZcUbxPOx9hOy6oV8ato3hcpJxUh0hb3bIhl+e+ZGR
	Y3FM6JST6MI4JDzzimz21/Jgpifdmqiw6no7L5LtT2he+fsrOB6RtNHg==
X-Received: by 2002:a17:90b:3fd0:b0:35f:b5df:449 with SMTP id 98e67ed59e1d1-36140490758mr44947016a91.21.1777263368128;
        Sun, 26 Apr 2026 21:16:08 -0700 (PDT)
Received: from arch.localdomain ([2405:201:8043:c04b:e09f:2c00:55ad:2561])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614371a7c8sm30239779a91.5.2026.04.26.21.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 21:16:07 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: gregkh@linuxfoundation.org
Cc: debjeetbanerjee48@gmail.com,
	dtwlin@gmail.com,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: document c_cflag handling in set_termios
Date: Mon, 27 Apr 2026 09:45:53 +0530
Message-ID: <20260427041553.6323-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026042618-whole-cassette-b15e@gregkh>
References: <2026042618-whole-cassette-b15e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 26 Apr 2026 21:16:05 +0200, Greg Kroah-Hartman wrote:
> Ignoring is fine, but shouldn't the bits be cleared to let userspace
> know about this?  I think that's why we wrote that FIXME all so long
> ago.

Thanks for the feedback.

That makes sense. I had considered clearing unsupported bits earlier, but held off to
avoid modifying termios and left them ignored instead. Your point about userspace
visibility makes sense.

I'll send a v2 that clears unsupported c_cflag bits accordingly.

Regards,
Debjeet
