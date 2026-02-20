Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35A3382C5
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582183; cv=none; b=AkeFxQ69FN/1+9/v2wubaxczBy3gh7T/lCwAnwWmUI50b9ZZ9XmMTBIMLdK948hF+cIvoX69fbDpD8leTG4/LYR8dFRNRCJuS3YfV3Y+4fZ7wEcOifIqq9G1HI1BFKB3KzDU5yfyGT5bKC+mty5Cp0VCgkwS1/HxbQD3T+ifFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582183; c=relaxed/simple;
	bh=NffSIuA1ZOmU6mG6Y7xhsRVWoy0KQMLvQ7QVOjXnuEs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QUSxgXwoXzqrRWUq6EaNI9wEqax7PlCIKerkODeKf55wz6bCyhwAcflnKF6QKirqQ7iofxm9bumMo8S4RFEZrOgxN32avEXUEzzbAJvbIe9TgYNsvmMCln4Sd/cTCbjgpY6kkkuhPWWFo4sRMxIWR+PMd2/4GXl45Y2mdws0ZZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NvhpyIIR; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NvhpyIIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771582179; x=1771841379;
	bh=rxDkQVYPUMPUKg82CLPv0ZsWBUjDjlpt9sW0o5OsfrY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NvhpyIIRe+rvbMKew5JbaSSo9JE9PT0aJ3+3xBZ9q+q0m/YLO0d0TvIGwvpVVklKp
	 Wg2TrLr7/i73575AnEt8wfVVEAvdfhHoAjns7jy7oH7cZdXIP2zrrpKvL6rF54Dfut
	 MXKfvvvOol85VWgQrP6pMUS5hUsYgHPNDlXHNjkhPSaa7ItX1r5swgmFNSs2j5pv6g
	 OKo3mXTEh+WZp+QvH3jhdSRjHlTu5hPy2EoUSEEqY7tE5wt0ZMWpLzhxG2FJBu3Ydd
	 bfEqOCQhmvjM/q2HVoo5B6+VoVoPYLB7J6LUKmWGFJdjI2bcYvU6rjonrnpW37B4Zt
	 UhM+IAj+5fBAg==
Date: Fri, 20 Feb 2026 10:09:33 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>, Hardik Phalet <hardik.phalet@pm.me>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
Message-ID: <DGJPGRAT9SXJ.1JK6YJQ9SJLNT@pm.me>
In-Reply-To: <aZgWffV8wwa3MDW1@stanley.mountain>
References: <20260220062741.399677-1-hardik.phalet@pm.me> <20260220062741.399677-2-hardik.phalet@pm.me> <aZgWffV8wwa3MDW1@stanley.mountain>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 06a9279b9549fc4c99661ea8ae459cec68a529ba
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Feb 20, 2026 at 1:38 PM IST, Dan Carpenter wrote:
> On Fri, Feb 20, 2026 at 06:30:10AM +0000, Hardik Phalet wrote:
>> gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
>> can return NULL when the requested id does not exist. The returned
>> pointer is dereferenced unconditionally via kobject_get(), leading to a
>> NULL pointer dereference.
>>
>> Only take a kobject reference when the module is found.
>>
>> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
>> ---
>>  drivers/staging/greybus/audio_manager.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/g=
reybus/audio_manager.c
>> index 27ca5f796c5f..1da8804e61ca 100644
>> --- a/drivers/staging/greybus/audio_manager.c
>> +++ b/drivers/staging/greybus/audio_manager.c
>> @@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get=
_module(int id)
>
> I don't think this gb_audio_manager_get_module() function is ever
> called.  If it is then we need a Fixes tag.
>
> regards,
> dan carpenter

Thanks for pointing that out.

I double-checked and could not find any in-tree callers for
gb_audio_manager_get_module(), so this appears to be dead code and the
NULL dereference is not reachable today.

Would you prefer that I drop this fix, or should I follow up with a
cleanup patch?

Regards,
Hardik Phalet


