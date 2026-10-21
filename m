Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562526;
	b=RmA+1OFHEgsCGoxk3dGEM4AxPoVtiI6+r+A7WeGwRaOI0RrVZTg3cnYj1eK7fHpXGyh2
	 iK9GUDEeoG58G55n711fUF2SMmEHoVBig3C/L1dyhJM3wtdHdk5TpXZZVKn6E9vookVcz
	 /LHi2zcKCXLaEXtYG8+tb+bvWcKODoUUzG9XOVOtYsNp3fLUHs4BGl+5wLUM1zTEE+mWn
	 iZQsHJhRFkwUjdjyQEeAmaAZfjuhLeVz7KzduDxw8wgPCI17H4FbEKKs69WqnudLBAPmJ
	 ixGEPcHdhqXz7fp7xhSi26mQZlhZsi+mndezadX/+iVxzYBdFaoQylvKazMfYP/XW8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0sMVChQS6GVQNygvoifUMQG1uQ0IZzpXQhMQ+9mKUZA=;
	b=JzAFRrdueddR7D3M+zfc/9WLShXritSG0cAtSAVr2DpBwYe9SyaTqB7264m1frQBPu0x
	 rdA/EHIDpjLmNewujYaQC2PsudKI+VBYPHmiDOUqdqVpRpM8cLMApTjbHnQS0zefPjpBu
	 fNn24RTyY7xh+II7gXGewhVwnCM99p8A1dAHN/AjjY+oIaHE5H7htdFcenlOYyM3La2jD
	 EET/HQfluyJM6yEVBFGK5rwd0aZShpKzZD9DCG8//APsKNokdpBwpBp+XyhXBPprIBSRY
	 OGG1bbUaa79sRijy6wyoySHe638GhQPBAKYtChuUG62hke+JPhRSIgetGX+F1eri8lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gCWBq1DQ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CFB606A31A
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 06:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gCWBq1DQ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so935865f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 23:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562525; x=1793167325; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0sMVChQS6GVQNygvoifUMQG1uQ0IZzpXQhMQ+9mKUZA=;
        b=gCWBq1DQjzGKD097EZrqXl9A9zY6LJ9DBmyddgEwPgimLRWEh6dNTPiPb0UAW5Wkf1
         lHLLC6zWilLEVgNvkWSF4KpRDh+G1zdEHYTLjnd0rAMsgeJKKFwCiJ9zxy21bYmeYe7U
         1ZxWAahBtgLgyC8mW2GUZlQ1Au0vXfE6zM5Sa7/Tav7ABql0pR5JHDpqfTi8UjC3AOjx
         TNqf/jEyZiGQylwGwk7Xb7RTt5z0n2PuPE2rDBHDQznlA9fLB2/FOuBjZYdqfCUtikpp
         5uio1MnahlqZ/q9pz50RRdZOtm9J59EeiZ94UdVKd9R58DqZyRZnRFQ32uwGNs2Xde5f
         /eRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562525; x=1793167325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sMVChQS6GVQNygvoifUMQG1uQ0IZzpXQhMQ+9mKUZA=;
        b=0+4ENCRKCO16IRbhr7iGarvotBVIw5Ov06h7s4gpMuPMqfyDD2Tt6RA9tAirZbkguc
         qd3JoMl+lChA9RMOZhCkknV0JbZX3Ssab5z2KVzugzLO9cJe+030f7OlFlTdTRRFlF5Q
         bUzLaoJC0VjOW/RJV8DGSemfkzHoOIBMggK1zuNxIa1bVJqqif/bS3th+WbgrEjRl0b5
         XD0I3Yk/o64Dgpq1tiYfxMJEvExtNi/5omEN9NuYKq1KDRtI8phs7Jj4Wj6RR1GjAJM8
         IZXR6+ZkKrJzqRJ+Zxu8/mnOarGE0wZwVc+TfElwyxrlkYuuyM5Lo1JxMFq3mSLbHISQ
         BKCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBcEchMF9ppy3Pk0u5/8U3L7FV7mslItxkyLFj3uiZmXnddavocZ9EiQrfE68QDBoZGzcDjSgfCAFYzarl@lists.linux.dev
X-Gm-Message-State: AFq9FYIOG7M4CLdTQ21cIROlCCwSMPCK9fy5lYgxUB6+xHSz7EuujTl9
	rSA7mJyHyqPTA7KNjLN8nGZDSHLUE6xaM5zL4FVEBmQUxiD8cFfzRMt7
X-Gm-Gg: AYBFou0OnDCFe6I3B6iOmosfWt1TPwW9bsVkEks7K3o9d9kZDm2eE5Evnqow3JbwZxS
	jBfqedRbM00xBKXvC1RyUkOBOQQ0bGQgesqVjOpahNNUUdqtv/8iHo7nlHXljWJEVN3jXLY83s3
	q8FJEB338a+OoMX0RsJQEUjscNq+j+9w3S6n/8sMO02UPUO8spIUNKmUpwp5AT8fD9lrwFwoZrR
	nqhmNmvqp64SSrHFtPG7MFzMlwZT4XV5+QCpKRacc/LwXUWzKBNUpO8tGOopQU6iBURjK5O7oKn
	EYLhBJuCanQUL5caHobcdn5TRo6rozCgm+ovrHjuSVCAoV+9BpU7oQi1qPH+uqOFV27n8fIrI47
	7FQRl1OHp1faJULJM6Vnqc19TJjj+V3NHNe+GiM9fp7oHhQoZolxaql7/dB+CfGEQtfHljx8Ynr
	NAS5B7NC48iNIm7/iGwhhkwE7x690RDvEujgxoZKy/IMlfHwtYE7Bx3JEKxeS82YGJ/8ND5xuXr
	6umzoELWR06qHYNtBMSeeLHw3TFpdYzo4leVzcQAmHAgYrrNjk0
X-Received: by 2002:a05:6000:41c2:b0:48d:bae5:41c with SMTP id ffacd0b85a97d-48e1e7cc62bmr10282873f8f.17.1792562524443;
        Tue, 20 Oct 2026 23:02:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25841fe4sm3427338f8f.53.2026.10.20.23.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:02:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:02:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: handle zero image size in read/write
Message-ID: <athVWGRs0HoPO8uH@stanley.mountain>
References: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>
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
In-Reply-To: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>

On Wed, Oct 21, 2026 at 11:41:38AM +0800, LiuJunyuan wrote:
> vme_get_size() can return zero for an unallocated image. The existing
> image_size - 1 checks underflow in that case and can allow an invalid
> position to proceed, wrapping the subsequent count calculation. Check
> image_size and *ppos directly instead.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>
> ---

This one is a bug fix and needs a Fixes tag.

regards,
dan carpenter

