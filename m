Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C23A63E1
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429283; cv=none; b=SeDOe8z8twm+tTf4irLZuEsDJnq53RGEG8Js8OxvCdCBmS2d4zOkVBv1XVG7lE/MwIyDtcC8PvM9dfgQSS1R9Ix7rvi3vglrNFOe5zEI68b/vKs4RP0HCueTHu6bkkEh+YxqSkC/kfJ+o30yn7e4WE6/udxnIdCdroGW/VMiu2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429283; c=relaxed/simple;
	bh=A4/lN2o5nrJZD1TaSGWtLKsSBgYWyqIQ14xL1HkJdag=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=Pqk+0VgClLv5Y99d3qs8joveEm6tBxNFSgAVpOkmsNlJ9CaGmB0FG+bio2Ev/BDGMfjg4zROL588YH0oBEDKuJXXmKomcsUlZCUuJ2WswnWg5xYaMMde4QyIrD6vVhnhGmOfMT6kuKheXwY9g0LR8CI0bRFf1SE8cYNgP4k0wsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=KUNGoa+9; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="KUNGoa+9"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=A4/lN2o5nrJZ
	D1TaSGWtLKsSBgYWyqIQ14xL1HkJdag=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=KUNGoa+90wyZGJ5iWuzrMiO7LV2507ieTMgEt4
	Q90vrEO88Y+DU/ZHYmXJSunb8Ci/q1K6vpm/pkuD6VsO/OGDuiK5nGaWdQyPVsbyvicgC7
	+hBWsZB0QR0bjTNts1da96dXrCFaXPUAVxZdANt/qp3ubatiBK/ZyvwesL8GqfSII7hV1a
	oQpHjIR0CIdfCixUIoHL0BtXB0D2symK8GitegpmrD8m3fnVxAS2OvW5JsIO4oB9pvXV+w
	PKUDbHuawNusqDcIfFFivaGdcjTTDcXqHiRw6ilqWaLr0vxeMj9wnAa3rD0rBC5G9U+UdS
	VgQXMAcYTBVh5/MX3HhfoB3g==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 757b15f1 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Fri, 22 May 2026 05:54:33 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------QAyNpt3YNObBIT0a0eATbTL9"
Message-ID: <941f04ce-b6c7-4c96-8056-d7148dd1aae5@al2klimov.de>
Date: Fri, 22 May 2026 07:54:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, Elise Lennion <elise.lennion@gmail.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
 <2026052158-willing-dreadful-857b@gregkh>
 <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
 <2026052249-shrank-trophy-14ff@gregkh>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <2026052249-shrank-trophy-14ff@gregkh>

This is a multi-part message in MIME format.
--------------QAyNpt3YNObBIT0a0eATbTL9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/22/26 07:07, Greg Kroah-Hartman wrote:
> On Thu, May 21, 2026 at 08:42:06PM +0200, Alexander A. Klimov wrote:
>>
>>
>> On 5/21/26 10:38, Greg Kroah-Hartman wrote:
>>> On Wed, May 20, 2026 at 08:03:59PM +0200, Alexander A. Klimov wrote:
>>>> kstrtoint() returns "0 on success, -ERANGE on overflow
>>>> and -EINVAL on parsing error". In contrast,
>>>> manager_sysfs_remove_store() and manager_sysfs_dump_store()
>>>> checked for 1 which always failed the operation. I fixed this.
>>>>
>>>> Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
>>>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
>>>> ---
>>>>    drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
>>>> index fcd518f9540c..581791d566e3 100644
>>>> --- a/drivers/staging/greybus/audio_manager_sysfs.c
>>>> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
>>>> @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
>>>>    	int num = kstrtoint(buf, 10, &id);
>>>> -	if (num != 1)
>>>> +	if (num != 0)
>>>
>>> Doesn't checkpatch now complain about this?
>> No.
>>
>> $ curl -fsSL https://lkml.org/lkml/diff/2026/5/20/2139/1 | scripts/checkpatch.pl
> 
> Please use lore.kernel.org, not lkml.
> 
> Also, when using b4 to apply this, it sucked in a bunch of other random
> patches for you, please make new threads for everything you send.
> 
>> ERROR: Missing Signed-off-by: line(s)
> 
> Why is that showing up?

As I already said, https://lkml.org/lkml/diff/2026/5/20/2139/1
cuts off the commit message.

> 
>> total: 1 errors, 0 warnings, 0 checks, 16 lines checked
>>
>> NOTE: For some of the reported defects, checkpatch may be able to
>>        mechanically convert to the typical style using --fix or --fix-inplace.
> 
> What about trying --strict?

~/Code/linux remotes/origin/HEAD
❯ scripts/checkpatch.pl --strict 0001-*
total: 0 errors, 0 warnings, 0 checks, 16 lines checked

0001-staging-greybus-audio-expect-0-from-kstrtoint-not-1.patch has no obvious style problems and is ready for submission.

~/Code/linux remotes/origin/HEAD
❯ git log -1 --oneline
758c807bb943 (HEAD, origin/master, origin/HEAD) Merge tag 'efi-fixes-for-v7.1-2' of git://
git.kernel.org/pub/scm/linux/kernel/git/efi/efi

~/Code/linux remotes/origin/HEAD
❯

I attached 0001-* as .gz, so everyone can verify my claim.

> 
> Anyway, think about rewriting the check for "== 0" now, that is not

I'll send v2 in a minute.
I **guess** you want X,!X instead of X!=0,X==0.

> normal kernel style.

;-)
git grep -nFe '== 0)'|wc -l
--------------QAyNpt3YNObBIT0a0eATbTL9
Content-Type: application/gzip;
 name="0001-staging-greybus-audio-expect-0-from-kstrtoint-not-1.patch.gz"
Content-Disposition: attachment;
 filename*0="0001-staging-greybus-audio-expect-0-from-kstrtoint-not-1.pat";
 filename*1="ch.gz"
Content-Transfer-Encoding: base64

H4sICGXpD2oAAzAwMDEtc3RhZ2luZy1ncmV5YnVzLWF1ZGlvLWV4cGVjdC0wLWZyb20ta3N0
cnRvaW50LW5vdC0xLnBhdGNoAK2TUW/bNhSFn8NfceaHwa4sRVIk21KWIkbbdMXWYmiKvgyD
QUukzEYWDZJK4m4/fpeKAzhA2yHABEEQry4vz3d075XRW4g6ztOqWGR8IRdFsUhnvJrxvM7y
6iwveB3TJap8jve6w7XYIZkjjsvhRhrHCbuiMiVGy1bc864WBssIv7Vqq29H+KUxFNty64S5
5G16M8SjWrxkr7kTJa6MmiJN8Z7vqVo6QzwvU7oXCGKqzq779RdRuRJ//rH89OrXv2Adb1TX
lGiM2K97W4L3tdIlxP2OEhFDeqwb64zTqnPjyRSddkgYO4rBCNebzmIUg7hsX1XC2inCNx+X
H96+8TF9K4xs9R0jAIq/+/B5+buP77ixJADCGG1GEd51qHTnDDFO2ZZ3vBFmZfdW2pURBCtW
1mkj6Exf6GlC3W93j59ZtRHVjaghtUGCu42qNuDtHd9bSK5a+uI2AnonDHdKd3QypLofwspG
jF3RguyQBU8TfiazIikwHn3Hr9UTISU+il3LKwFrK95J3Cm3OXj4Ak7DE7cCt9wovqYXIiZ7
rJcxmrBr1XSiDrWU4Xpf4hud8KNGCMOQoTbKFzw9yD09qD39htiowj/IEAR+X0IeeD0b3jWi
plaC6qww3iA7DiY+UItWPKzDCWO1khJh2CgHfvq8U9fPy2eKPLiHrOo8Wcgiz+IqivJFMi+S
Op/NxBmSOJ5lmTfguVpYEATP1nN5iTDLpnMEw5OWtM+pin66+ipWDj/oXmqFnqbrRg/jiBf+
ZcrAcELzhK7f4uJo5ta9nBLdFD+renJOaeGJkhj7tJ8ukExYcLyOJ1Tm5GEiHyftfKj9ULdZ
r54CPSgbD7U91Cz3UMPzv6COJu5/Q7rwSPj7COrCQ1GEsL6DMOjY6rpvDxyUetg9uPFoB63P
qUHA0ijPopixfwGgjSqutQUAAA==

--------------QAyNpt3YNObBIT0a0eATbTL9--
