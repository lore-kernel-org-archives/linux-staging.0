Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467964;
	b=arJVNKdvBVE7GlR6mxXQ9iy5DkSuNKz6YsGaykIV3xUsKbq7PMxkudPf/nsTPHCtAo8j
	 EZODevKzv0L72FitA+LbKeSn+Mb2o2rOcHfonfGn+1LqAt4dUe6cmgRKphwvXNXPbcqV+
	 BEdYTIKu89ILWbEivM15aP4XwFR9OTovLAi8XlRRa+Jqt1OBqhahu6l79+HL4Bhf4XjX0
	 X+IlDxqy22qz636WRS+TLDOb1NmM/U+ZSRx+p3UbDDpgfPjEFvOgmomvn0ZT+yE3Lm7G0
	 Y3tGIOPAsoykS9tVbeGWcJeR8m4QrfPQv9nxJdWfuWVsn5opxFVlxrxnRcw1TTFIe0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467964;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5t1IQ47c0TX9II5SZS9sRg3rlhGHOvDYZKROwdCbd5o=;
	b=C5uqj5rnsk9lIbsJJFXVy3rPmXjOU4ZhJZt6h95GetajlcK0zedxYbvEtFeuqHltAaSK
	 PlepLi0nnEa/hM+HhGGNHSu2sg6jBk56l571z6oKlasVI5jpR0Bm6TklEi4obTi8lOyuc
	 RP6755wmTEk5V43RWA2O755/Laa/sTPZLOdehTOTstDQTla+P/BaX5vNz73BczIe+yoRy
	 yw+n1ysjAt0rmBK53ewB4ePBmo7qYyYMIqcDkWlWsJUnxmGeDqT7mPqdOmn79Lw9A7Dfe
	 1671V/6F7K6QUU1iitM+fNJRY6gg6LwtOuxSmHLx4m1Mp3cNUp8U2Q/FxuGr3JhiRLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF2606A323
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 07:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEF2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4794815e9.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 23:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467962; x=1795072762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5t1IQ47c0TX9II5SZS9sRg3rlhGHOvDYZKROwdCbd5o=;
        b=WnW59o+cMQdF/uthkplkRznvGV7hqp6plSW7VBrib/OMb4l0dty+vMY5fJHQpUBasN
         b7x6rO2IR5SVQsFXQRZ6+8vj92Mpf94JMrIiamci9pQ62Bz/cKxgZMhSfzDB+tdV9A8n
         ibIgrcUYDeGU1K3OhIaWH88lTzwL5dzqa1iUov5AUFC285iV14RzYB7deoxQET7hBdQm
         pOyI1x83QzOLZfPQGRHOhMkjIMguGPkA8W8PUjcllrilWZ3uWbHTM+maHIozmKRBexej
         GDUcPQ9fZGWMmamNSSqpYzDsKxtQneew7BTpeyCW7O9n09aE4tzhbrFeuIwIseWO/QNc
         lTlQ==
X-Forwarded-Encrypted: i=1; AL+hErEqsIzlc8Tj2dnqKsLLwCncMJNW+5VpqFLFASQeMSzyS/ua19u9oK80FshN7kauGY91nvGMskogfPmgjFBF@lists.linux.dev
X-Gm-Message-State: APuU4Z+h/EHfD0sIyIj8Axmt0VxK+wz90uUK1vohnum49b6uS0OVoKTt
	Z1bq3fR49d/96oUiuBBQykYhefHzp29hj57aMU2V+rlPtNzvUJ7865vc
X-Gm-Gg: AYBFou0tej359PQLey6AMTeBTs/abelHlWehfXKucuwMtvTdUmqNsuH8wJenf0eMLN3
	bLCLX3rioh9/W/67HrBdFkH2V/kJgrIGUtrQTZf3KW3ECOd5ydOoore8T43WuiKEkYAO2IeEGIC
	hLBaMqLavsVb25UxGu2rWGgYMdK4c4iBnI09yO/qccSjgVR1TiWkl46qrJQAyRa84c1dToZas6k
	xb+2rMRo5qSXCQl0IHv0lipZLlXaOezVqxWEsdONbJW4xXd+3jtWpeAwmUc4E2JiXz8fvlwQP/I
	xQ7kCWTV4XxXGqsr9YOAP2xUz4EAUyBHavu8ZCYNXVeLa0YsAN6xb19lCRmYAbQD3bbQDo5FY3t
	E4U/yk5npB95QNFYU7f2VNRMMrtfAHsdCSveTtexJcapxeedTDqWU8mcSsPvw0nCnHhtmElSObh
	dQHZv+/13t7oankKpBFQ+dE8Z6d8r8bY33ElKPntRSFEvMklQunWCGCjXZta5j/1cr+B+hHm+co
	5FJETQiJJ0+3mpTVdus/IaHjijbxxKdUTCqeXs4eFXALJxmyj7YJtmdx+B/TTsXnuTEFvy5W54c
	NaEueUAIEd/wdA1vfmL3990DspOIZ6xhln3xE0ZnzonflXpQQx5D2H6D5Wt+PBZJViIKrbH/qrj
	nzVpAzCvtOMhuR2kyQFBJZ793318d3NACveJnpfFQs3GYbA7Ue2bOVXr0YSez
X-Received: by 2002:a05:600c:8903:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb4e2e9c80mr27941195e9.11.1794467962133;
        Wed, 11 Nov 2026 23:19:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm11633378f8f.32.2026.11.11.23.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:19:21 -0800 (PST)
Date: Thu, 12 Nov 2026 10:19:17 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Alejandro Lucero <aleszlucero@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: octeon: fix probe error path and
 pow_send_list matching
Message-ID: <avVodR7YhtYHN20R@stanley.mountain>
References: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
 <CAHDi9tqk3rHYJZ2Abu5Gn-=xVhA_AawCX9VRK_Nu0sHmNkeM7w@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHDi9tqk3rHYJZ2Abu5Gn-=xVhA_AawCX9VRK_Nu0sHmNkeM7w@mail.gmail.com>

On Wed, Nov 11, 2026 at 09:34:30PM -0600, Alejandro Lucero wrote:
> Please disregard this series, I sent it by mistake. I will send a
> corrected version shortly.
> 

Please always wait 24 hours between resends.

regards,
dan carpenter

