Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1003EDE7F
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 19:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613364; cv=none; b=RfYzHNzFaq84A/5ZZyhWVwjhWifhLjOSCg+ilgqhgKXB9UeLyRmKFvEHeoLjHlWfkJwEAQ2lfPfxsZ/fDjmnqxtrRgW+VXJETwt0vFFnJl4B7k5mAIavBEBNlsDluWY1IFfUWVKI5KQrS3z0WPTJELrFYzneCiac2GXT5tFJdSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613364; c=relaxed/simple;
	bh=nSrzsEM4v9JYjvlMGeLKj765Mq3O901EWWl79pFBeS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQOhVEyd1STJuc84REXC6PHba8fjfJ0+Pfsu49C8VTwJ3lJhvjBzIJEUZ/SgTmO8Wtkn4JqmLYx3a0MzI6/X/dBTkZPq4SW7LNHnzp5JU6Ba+3PUlnrocKwZALFdoehnWMQgCIOo3DPJACzZLc4BF4tMcDMzBJnmZtaOmOI2WY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=dF01P+wz; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="dF01P+wz"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=nSrzsEM4v9JY
	jvlMGeLKj765Mq3O901EWWl79pFBeS8=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=dF01P+wz2wQO+ekJj3NFr0nKu4E/KeqyHWUx/V
	1vcL5Dk62yx8Mo7lZ/yMmdHa0UoLybDw64OiNdDrAJzYIJ74XV2hgAa/dW/pQcfBNZ045z
	SoNyhqF8w1z1CG/QchUSKgvkSBdBAgYGzp7fBs/VeCG8fLhk7N7rGAfl3jPPjx3VJoVr7n
	fYk3nSLCarkMf6YGTO+wGY7UC+MB6nO+lV5Qic5+8dJbNx8SlJF79sYawerflUQL7PWB57
	dXMGSRyeLBpAX9ukMsOIxaDZIlr33tN2vPLd7M8yIH+pJV8+iqwtRJe0xmawdxQm6gX/LF
	pJDB4g+zuJNC79Vu6gK6UMhw==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 89055c18 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 12 May 2026 19:15:55 +0000 (UTC)
Message-ID: <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
Date: Tue, 12 May 2026 21:15:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3] staging: greybus: audio: correct sscanf() return value
 check
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, Vaibhav Agarwal
 <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
 <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
 <2026051243-factual-lyricism-6c54@gregkh>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <2026051243-factual-lyricism-6c54@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

manager_sysfs_add_store() passes 6 pointers to sscanf(),
but required latter to return 7 which always failed the operation.
I corrected it to 6.

Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  v2: added "Fixes:" to commit message
  v3: added all these v2/v3 lines here as requested by Greg KH
  v3: while on it, replaced title "Greybus audio protocols drivers:" ...
  v3: ... with "staging: greybus: audio:"

  drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index fcd518f954..ff323ca815 100644
--- a/drivers/staging/greybus/audio_manager_sysfs.c
+++ b/drivers/staging/greybus/audio_manager_sysfs.c
@@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject *kobj,
  			desc.name, &desc.vid, &desc.pid, &desc.intf_id,
  			&desc.ip_devices, &desc.op_devices);

-	if (num != 7)
+	if (num != 6)
  		return -EINVAL;

  	num = gb_audio_manager_add(&desc);
-- 
2.54.0

