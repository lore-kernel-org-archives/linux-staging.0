Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AB110A35
	for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 18:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713725069; cv=none; b=i/CbbfWIrr3MKk9dTX7xj9qtRLFtaydBKsiEtWWdl5bSh0hY21QeGZOgNiZq7/+P2XXWAaTaq4ZUuypyZAtdaG21qPyqVz4wbcRsUtCX+/PHzvGV/o50CxhrK4+2AsLAOAmHFpUkvVeGdl+JcwT79vPX5nRuX3u+nugJO3Y9htw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713725069; c=relaxed/simple;
	bh=oNhP/xj4oPiwJOXjOOXAUqqAKb20EGQzG5PGlewfRtA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aZv3Q7ArU3UPqoMFnvrDfS5+trqcuNDvND8Q9mASK7psum7i7iPwUjdZph3js6LzJRktny6+LJBJ6vCi6m8H64YgGGoRbYIdUjrUIBfpsJHeIgYvwY3dqo9WVfyA0S9V5bzFmF0pmPIvW19Hs7RjcGLrkNvUgYAPW/vcYHU/j0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=BiM3wxa5; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="BiM3wxa5"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id EB8CD240101
	for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 20:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1713725059; bh=oNhP/xj4oPiwJOXjOOXAUqqAKb20EGQzG5PGlewfRtA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type:
	 From;
	b=BiM3wxa54MKBBgVzTONc0ijllO84sCdI0tuqzkeD9ipcYMDd7xoFxKJvjBXgl8GD2
	 DE165v4TK+x5aOZn+bqPE/DC+pkXYgGYWRfVYMkFnosZtAdpcMWs733hN9kkVyIuvv
	 /PikqCaWrASNQlh1FG3aHyPYQBbXYfpXyjxPojPh0CYVHW69dJi87YPxx7AfhqzMwW
	 vqFsxkKUkKsTPhDBooKDWkvb2mq9b8G00hDdFHpk1xvpOYY0+uUMcZsbwAFLFHg+3R
	 fQ5JyxuTX/YhpfvXa3fPAwMcI/KcEzCt/r6Tc14JE6iaYqWlx3ZTPCikruYvXQhbmP
	 IGkWCyNM1lzbg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VMy36123dz6tx7;
	Sun, 21 Apr 2024 20:44:18 +0200 (CEST)
Date: Sun, 21 Apr 2024 18:44:18 +0000 (UTC)
From: Marc Dietrich <marvin24@posteo.de>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Marc Dietrich <marvin24@gmx.de>, linux-staging@lists.linux.dev, 
    linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes
 robust
In-Reply-To: <2024042118-errant-causing-8bc5@gregkh>
Message-ID: <0292c723-0cf4-3a4f-733a-4b1e8e6b3efb@posteo.de>
References: <20240421104642.25417-1-marvin24@gmx.de> <2024042118-errant-causing-8bc5@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Greg,

On Sun, 21 Apr 2024, Greg KH wrote:

> On Sun, Apr 21, 2024 at 12:46:42PM +0200, Marc Dietrich wrote:
>> The i2c controller needs to read back the data written to its registers.
>> This way we can avoid the long delay in the interrupt handler.
>>
>> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
>> ---
>> ...
>> + * A write to an I2C controller register needs to be read back to make sure
>> + * that the value has arrived.
>> + */
>> +static void i2c_writel(u32 val, void *reg)
>> +{
>> +	writel_relaxed(val, reg);
>> +
>> +	/* read back register to make sure that register writes completed */
>> +	readl_relaxed(reg);
>
> Do you need to compare the value to make sure it happened properly?
>
> And how is this an i2c write?  Normally that implies this is using the
> i2c core functions, this name is going to get confusing very quickly...

I just used the same name as in i2c-tegra, which may be helpful when the 
drivers will be merged in the future.
The reason why a readback is needed is descibed in commit ec7aaca2f6. As 
far as I understand (it is not mentioned in the TRM AFAIK), writes are 
somehow buffered and a readback guaranties that the write really reached 
the controller. The alternative was just to wait some time...
From the commit message it seems that this only applies to the interrupt 
status register, but it does not harm the do this also for the data 
registers just like the host driver does.

Best regards,

Marc
