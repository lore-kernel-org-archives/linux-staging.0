Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781277;
	b=qRJEtrJBmNBP5Jaums5u++08oWFrm2djlbNcM8fAE96bGkd9gTo0eF+/Rdo3oDJcB/Vu
	 lGhjnH9XdgKHwuZdcTj9U9J6PJH20SLvIUQvzdtBw61ORz0VMvAx+8tSn5bsjNz5sAjws
	 6T27Ez6woekfSM9WFGTteobsWi4OzGPlHi8B8lovYIEuQIzQE1DPBOJsBfFXLnZcnhryG
	 hJe3fFv409xIcO47oacGYqFFeNinqrXGkKcM+8CiroGjPHO47sdxGDb6HUjuYzjIl76Ji
	 aGJyJv6ZfwJzt5ULJOqHDhKze9hvVZUs6XCZuRu7yPwCF1tXqmy5+dCvIvM3/pO7KAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781277;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hYZxFY3YN83cRM0H2M4lqnHe2OCek2s7uLf9HcJ3VjU=;
	b=GSmIdS6pPU42l8lC15RTDCrDs1U03K5Gu1DwdTIDjS1Ww7ZT0G70JipCBkGLi8ehUVH+
	 05MOhvhwI4nWIBI+leK9RPXm1GWbLSSTMIp/mXrG0Jy/321/7kwqTFYY53A5ZCbFiIcTP
	 NoAh7iuTnvhpruEAcrPB3iQ9eKWUl4DjZyWFtOth+2co18AhqSyJ4STsbmR1tlInfIZtw
	 hyZZkSIRJNaVgbLZk8S396FWYjW6vasRxyWYFMjWTwqUQAzyOWi37XEKJnVjaW/NJITNq
	 8Wbd6C2F2X3iOOP18TiuXvIHDwakCKPIE1KaRFVFRSyis+gyjYBeh80kTuSaIEhAhrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lk2BKpy8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2AD606A326
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lk2BKpy8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC59C1F000C1;
	Wed,  4 Nov 2026 08:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793781276;
	bh=hYZxFY3YN83cRM0H2M4lqnHe2OCek2s7uLf9HcJ3VjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Lk2BKpy81LbgYKH8/yiKNw1+KhGTXqcQpncperTnauPF0S0yaQpQibmMZ8OkL1uBD
	 Zapjr2dHaSXX7iV3bX7zAUl8egWHlgiXtbjVxvWYD8LmKf2G62AJIcYXLzi7h6I9Pl
	 eZGCTDKiYEY+icwKdvTYi9yefcMc5SwETvdzAR8Mbsg1ZVv8TAHg6PIVbXhTvyuDzZ
	 5tyg38wKVUKbs9A6NtB8m4X3ygTDcV8VXTjPOQaHae4COQ3UJXvSwP7h9Yqb2A8s92
	 N0gEyeFNRMP/pD60zpYqRVPu0frS6FWobcLUJqFNGdkQi4mxSoA9OGrcFA4vpdDib6
	 x2hHcs0BIb1iw==
Message-ID: <006f5d5d-6c74-488b-b4ea-aa61cee4646d@kernel.org>
Date: Wed, 4 Nov 2026 09:34:33 +0100
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
Subject: Re: [PATCH] staging: octeon: release the port device node in
 cvm_oct_probe
To: Dan Carpenter <error27@gmail.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
References: <20261104021450.1468423-1-vulab@iscas.ac.cn>
 <aurikMTyOVMRHDl9@stanley.mountain>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <aurikMTyOVMRHDl9@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 08:45, Dan Carpenter wrote:
> On Wed, Nov 04, 2026 at 02:14:50AM +0000, Wentao Liang wrote:
>> cvm_oct_probe() looks up the device node of every port with
>> cvm_oct_node_for_port(), which walks the children with
>> for_each_child_of_node() and therefore returns the node with an
>> incremented reference count.  The reference is stored in
>> priv->of_node and used for the lifetime of the net_device, but it is
>> never dropped: both probe error paths free the net_device without
>> releasing the node, and cvm_oct_remove_device() does the same on
>> unbind.  Each failed or torn down port therefore keeps its device node
>> referenced forever.
>>
>> Add the missing of_node_put() in the two probe error paths and in
>> cvm_oct_remove_device(), which also covers the error cleanup done after
>> the ports have been registered.  of_node_put() accepts the NULL node of
>> the POW device.
>>
>> Fixes: 422d97b8b05e ("Revert "staging: octeon: delete driver"")
>> Cc: stable@vger.kernel.org
>> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
>> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> 
> Normally with firmware, we just take a reference to the firmware node,
> read the information we need to probe, and then release the reference.
> 
> Is there any need to hold the reference here until basically the system
> shuts down?

Just FYI, you are discussing with a bot. :)

Best regards,
Krzysztof
