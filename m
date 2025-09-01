Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97ED35082F
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729867; cv=none; b=Npsv8up+qXJDpRAa2oojkIYclkHIogyH9VBkuoG1VBVQdlWW4IwHpHONiRYH1MqggbmGek1VQ8x8WwYbBTy4IngTNzbZm+THbb8YzBVGzrR+Io5MFORBoqqnDfX27dEzxz+z2B0YcoM2x7CPELlR+9E30XQgSbhW6Gn5F3sJ7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729867; c=relaxed/simple;
	bh=QdiPPLZWJJB7/3u42OQnI20Eaqu3AwluA7etN42m9mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaWoYysGD5pDdZ40Kikv7NBnD16CufbAhv0pr7xb4DKwEA/yLbgB0wrPjPPXRd8Vc3fHXGhEIDc+KuyGi0YM7vls97mq23eaH6XvRz901H1q0aVBSXtR8XBuppxqji55XRt/TNn/LRZ7Y8XaEljT/DE4pQq9qA2tFO+UjsibKMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R53sFhZy; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R53sFhZy"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-323266cd073so416383a91.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756729865; x=1757334665; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdiPPLZWJJB7/3u42OQnI20Eaqu3AwluA7etN42m9mo=;
        b=R53sFhZyFa6rhgmuflkNddRkI3w4Y/4EZSDwhphm5C1n0T4P+A7VxiLxwSReresj6i
         ahmBaykP/dHSDhiHIoZrVJP1BoUDna83hlTOY7WQ0Mfk5pDnEBucrZshSC6u8l6f31L2
         W5483CKoGxuqHPESwNjffqvLICMyBi17CgOVVZbqW9UCUQXeh1OKN3PehZGTnBCVYp/g
         j0FXgP47BZovLPmrG79NGz54YRw+iAwuczpGEGOkL8jZ8dEapauYdlVg0djQF708s6GI
         sKI9Qo/XEP8HdtWZTOYhqclcOn/h3LO7Tl9ptmuX0TFz/3kTedc6LSuiiDeGDlW/aJt3
         h4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729865; x=1757334665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdiPPLZWJJB7/3u42OQnI20Eaqu3AwluA7etN42m9mo=;
        b=fr6Eidpz51VMT7aUYDFZAtucwOFgTK1ES+34GsLVVZGfQ9zyEb6sIEfwpEyfdJmdBZ
         I0LgDYLpH9oNin7CLNEIx0zgo73thfZIBNO4TzQxo9JQZz/2tMRbcFA6J8ekZW1eq1NW
         tUZ+G5NXMtZPx9AF7nP9st0q8Gk+NmG0qbgXt27uC5MtaroqtTwsdA8mu3nJkwMruVdB
         kQnvoD6PccZVHxpkr4D0ck6QFb+vQzNGfeByQhbHT4UIkQlrAs/nOIcZWpDU8AU+7fSu
         Fr28H43yUBg/leWNwg7YZAnGbCHi2RCYp4jQ47RupLegZvK9z3jsUqEgi9usjDTW2rEp
         +iPA==
X-Forwarded-Encrypted: i=1; AJvYcCWb5UljY+G4JRy+UkYhFJ/0kJ+rPirjfHJE3EiJ0Jiq09+d49dxoal2FUq1osRHfMveU59Z8qoW3dXMkc1P@lists.linux.dev
X-Gm-Message-State: AOJu0YyvdZz2VRhCRqgjRLH6R9Y37rXpLAWeQPAJ5hoZZeRr9DvEkDL1
	MBlWJswdAWBkKNzhOVtWcp6RbSUyYFTHW9mI6gvnwxIGJxavmjPLIlkn
X-Gm-Gg: ASbGncuAxqRRiX6RX2zkDE6jW/hVMfYjPuODg8/ELmnv1PlAMY+1sjva3k9XbNyIVZZ
	y9nfiHpim6bAKduzT6RhHuT/6AmM7P9NVlARrLJayA2BWmsLfBcXDgwX0C0iLVzyCeVwT651I5S
	W9jZM9sQlkB7LehLPXi8oEX6RGE0fNqgc6EyMJXsDURi1vlAJkEQCE0MmI1XMVK8+9Ld9Hf1wso
	7Jab/BEUYk591520Bx85FJuYx0QKdgEy2mQG8QM11zlJbAo9FdkUp6zUaA+ZRXGxFhezHIPpU+D
	/UlZcy1Q/0dhKLfQw3GLAAJoou0rSAoiPIhTcJ/juZHQaT9K5Ds1EE35WcQZMR2em0J9luIJg0Q
	GWvMBxJUqpnelKgHk
X-Google-Smtp-Source: AGHT+IHuPeIgSdm25HDXIhjWczun9s0SrO4hSzN9HThHTxxeNAPcVKH5+g+uW+k/rl8zuQL2W/L6jA==
X-Received: by 2002:a17:90b:1e11:b0:31f:11d6:ce9c with SMTP id 98e67ed59e1d1-327e666d073mr7238986a91.7.1756729864986;
        Mon, 01 Sep 2025 05:31:04 -0700 (PDT)
Received: from fedora ([2400:4050:d860:9700:8e8a:52de:86af:cfe3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ade38sm9252219a12.34.2025.09.01.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:31:04 -0700 (PDT)
Date: Mon, 1 Sep 2025 21:30:58 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com, hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid
 -Wformat-truncation
Message-ID: <aLWSAiAA8Ombi0WB@fedora>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-3-nogunix@gmail.com>
 <20250830212923.GB16364@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830212923.GB16364@pendragon.ideasonboard.com>

Thanks for the explanation. I understand now that this patch is not needed.
Please drop it.

Best regards,
Masaharu Noguchi
