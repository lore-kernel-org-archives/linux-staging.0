Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234517;
	b=emRBBmw+K6aMZyYPuZiRWL7cZwdZUYW3jCyYBeSWgJNA+OlPDALRizsIjVP7pGufZHwB
	 yCy4hk3yxCVHhY1S/+tCnJFOi6jMVVZdwXtiNfes+e1IRUvjo4T2PCyY7jNACz13eebTK
	 QzZmrfj+Y6VRdHx1AyWMVd+A/3YAezb5iQp9IluLN2OTSStwIi6BbVsMPcfgPUzp7pBLL
	 pOOZ0rFzDZsRGJM936tFlxA/CruUuvibvcHGQyCsaCXbTT+hvMPdm9/U4SmVkl9YwnMJ+
	 nF1x8wbTwgg9vj9GrASj3IrwjzzS5A8DF0gb1mnTrttsSR3zePpvndFfC0yoHsC78cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
	b=1E4lTsjbg0joFqO2+eq1y3xhnOd+GxMfcQ+ZbSaF2+XDl1IusLWpwIuw8+iYNisaIIWY
	 XL0ti82zBlm8YJpJFk04/jIP7lRw/MHxA3h2U8fv/E9l19nReJ7W5RUdbxHa9IKXujchf
	 SHoutU2Z4SfRlbGA2FSmP4NTnGWSYnSuwPAgk2DpAOVwZmbzhOMoYU+LlvXSuqEM/DULt
	 JuZWhZI6q8QhUZrItbFcrBMsBXsyLl688R2kGZLNXc+XtIfAq9oTSb+WP+Isjl+1bGOdG
	 t3SJbpnwwmut/qzm2PglapMvmmHY/irpGZLxeASCQkqbIQeyPCO6k9W4yRmyuoM/9og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=GV5ZWGMS;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88C606D809
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 14:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA88C606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=GV5ZWGMS
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4f699fe49b3so623610b6e.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794234515; x=1794839315; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
        b=GV5ZWGMS+uwBrlxMkyuDSQRZg7zfE//zk97tg9hJFVSgKIjW1dl2Yk6vJUmVAq6Dsq
         6xqaCWjrRtSHXXfcvcoABAKv7Rbw7NVDWARrZxbrzFoTp/ekOyMedYFDPDHdvosO8SvM
         JNHgcdzntgCfb+cMGWCHcXRIPutlSe66kz3Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234515; x=1794839315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
        b=KOkt8af1rrVDd0InhyUF6KD9ADk5yfNmzc9faJOvZboPTEF7HN0EuJk19loMqdGWhW
         J3OVT/VNQdYbCjgxjLdPzpQUVrJ1Askhk2LdIOL5ZelEXT1bfzxv8pQinQYqKQBP1Aah
         cWEArMaSCqOGr1zGZ+nSGd4Q/HhTF+NlJ4F4XII23sgzejOUb1O+90APNI1gHylVDeGX
         T+DuboOtcu0n7lN104gVVCxZ8OZGh+pgXYYRY4Aduz3td7v8gGPp7JhyBNvwYgDWmQgA
         o5TcM37UMe37Ns3odqOG2xI4/UgUNSqPADUWQQqwoo08khdpYeUqflxU7kb03VsECR1m
         pGSg==
X-Forwarded-Encrypted: i=1; AL+hErH9y3/FvQJsXfCf6EvANI1f3EEpJ1pxVyOVCac07mRP9Z+8K9I8aJkRArSxPoyJB54GYyKD4ujiXnPJX3ff@lists.linux.dev
X-Gm-Message-State: APuU4Z/jdyHPUNGciyDjvF7zQEhyleTS+mP/OPBw0Gj3uCjz3Nl+gnH6
	kPI5gSPPy+SxUOxpKTTtSHdXHI8NPybjk8YpP59w8MtVU1nHzr+9HQ64/cTqrPTn7sRaxbRMOMu
	q/Y7IBw==
X-Gm-Gg: AYBFou22SBlsydfntYfQa9gqZ2M2zG4mFytohAMRYEFmPf2aYLr/PZiBY6qwFipGGBv
	fF4JCxw2NGZTZj5MKX+5EsM1LhjnYXOVUloeAwiqfZxfn3QujxMoWACcaDqejOGYWb8YMh/9asb
	OxQZJuW8APaJb6wOw6cdlKHGdzyv5sNQm6hsrvcRgQwvnVmadV7qwHsOPKPPlBVZ7PhJJWIh6nf
	U2uTqD83xqSipaGet4FUXtii2hAo1+w2c+mRbzy44ggLTqZ6ORmE9GfSNdqe22IYsP3SQ7EaV+m
	pUevFotauRqOeXHqQ+WG+CYPFPaGnhhYThAm8Zx/gcDtau4XV2Y9msy0bgUkRndwwhWPYJ7ALwA
	PCv+WgN+hrUOwjne2qJpEbLTT2BvA0Y6xz5GLfAu1C8sH87Txt4yC3H70xtqlakBhSdcSu/gBxj
	+qt4Oos9wekAYT2akfQhau2uxpB/ygIsD6ahuXRB7QM0nUz8fJj1dWY+8/uzMjtfnB0kAUm6XQ/
	adOUL75nnPrUQrNorHYQZadnW0QlH1OoPD14a23mYxKhgUuIQjF+On7SHawvCt1fPnSKswvjd16
	z9dvIcAr73t5ywxBLVzpAboV7b27oFPGeuXnQmXbejVC
X-Received: by 2002:a05:6808:1495:b0:4fc:3dc7:66af with SMTP id 5614622812f47-5681432edb1mr2821350b6e.10.1794234514790;
        Mon, 09 Nov 2026 06:28:34 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-56813e56700sm4463564b6e.17.2026.11.09.06.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:28:32 -0800 (PST)
Message-ID: <5a2b5e08-c33b-4513-8457-b8ac21563121@ieee.org>
Date: Mon, 9 Nov 2026 08:28:31 -0600
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in
 gb_svc_request_handler
To: Chandradhar Kumar <chandradhar.2003@gmail.com>
Cc: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
 <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org> <au8s1_tIBa0mpTSL@TheRealOne>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <au8s1_tIBa0mpTSL@TheRealOne>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 8:17 AM, Chandradhar Kumar wrote:
> On Thu, Nov 05, 2026 at 08:08:01AM -0600, Alex Elder wrote:
>> Here is what I see happening at the beginning of gb_connection_recv():
>> - If the connection is disabled or offloaded, return immediately
>> - If the size of the buffer (passed in as the "size" argument) is less
>>    than the size of an operation message header, return
>> - If the 16-bit size embedded in the message header is less than the
>>    size of the buffer, return
>>
>> In other words, after these checks, we know:
>>
>>    sizeof(header) <= buffer size (size)       AND
>>    buffer size (size) <= size encoded in the header (msg_size)
> No, it does not verify this, it verify:
> 	size encoded in the header <= size (buffer size)

You're right, I misread this.

We don't read the header unless size tells us the entire
message ("buffer size") is at least the size of the header.

And then we ensure the buffer contains the entire message
(whose msg_size is decoded from the header).

But if the size encoded in the message header is bogus
(and in particular, smaller than the header size) we
have a problem.

>> Therefore (transitive property), this is true:
>>
>>    sizeof(header) <= size encoded in the header (msg_size)
> So, the transitive property is not true.

Agreed.  Thanks for explaining where I was wrong.

> I have sent a patch for this bug which verify the msg_size and header
> separately, which fixes the out of bounds read.
> patch link: https://lore.kernel.org/all/20261106094303.55158-1-chandradhar.2003@gmail.com/

					-Alex
> Hey please review the patch if there is something wrong or there are any
> other way to fix the bug.
> 
> Thanks.
>>
>> And it's not possible after these checks for this to be true:
>>
>>      header.size < sizeof(struct gb_operation_msg_hdr)
>>
>> or put another way:
>>
>>      msg_size < sizeof(header)        cannot hold
>>
>>
>> It surprises me this would be missed in the AI summary--and I
>> fear I'm mistaken.  If I'm missing something or wrong about this,
>> please feel free to say so.
>>
>> 					-Alex

