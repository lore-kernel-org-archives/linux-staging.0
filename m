Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341D94F4755
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564500; cv=pass; b=h18l0pYk2KeHt2pIaEikAytAt2BJ4FGdmVSm1Akvq5IJ7orhhSB/0tQZeP+JP1MP8xuJUJIq+CN9e4GpgvlcUNkHpKCdSS/ntfcVXKj3gAn5+Hq8dY6B0UjVM68Z1bPoAuK5nva1MZQ2bLHCzmwnw+oNf5hyUcBQcfDaLtlKLGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564500; c=relaxed/simple;
	bh=ayPxym0az/dPYYVwbAryo+qLlPY3Bz4ZHUPUVaRwQrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEEA6dKri+GDo0duHK4i1idJ/ZyJWWam20m79pJAFgWq88JdoYS2wJZm5KdOgcVq5wAKgpnqjJHOeyo0cLbk2/NBCBDshejS0grRhZ0H+XlQHkhtbuqG47hYm9ZyFTwFSRS4R0paIWBRLGm2xZJFRWWeB2ZHqGTpkfNk2wmDbes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpxwBWKq; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpxwBWKq"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530e28a62abso11761991cf.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 06:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789564498; cv=none;
        d=google.com; s=arc-20260327;
        b=FBNcv2YEmsMXmKO1t7ZYSbDGI+DFEaXd0Bjxen01x7wbFqPFzCNeKGadKR/n07/Ibz
         6jctsAiH6hkrwMsrNSQHftx/S9mvFsD/qxqH6HILe7K1Sz8UrkYUyjt6gzUsg2xGdWjN
         az1WwqybvXb3Hcs9RSYG8JyDdTmYdpaVDgWD/v5qvIP6ShfH2etgYgZ5pi6DoNUfgunr
         0ZZpX4UeA/l7uLkMHG5kILyNCVkg7dUNRpWWKkVrFFgDONEO/YYbNRjj3XqA+l74cNA+
         Ne3jiZG9nvQSHBoc+/2Zt8es6rKt0TtnN3u/3NdE4QJDWUqr0VCMX2jt2cvpEFSAiCM6
         NdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayPxym0az/dPYYVwbAryo+qLlPY3Bz4ZHUPUVaRwQrk=;
        fh=gtuFD0BKwgmol93EUjPFOxMD2yM3+uaKJAjxoia+pCY=;
        b=BHIZ7v9bxol2y5JJg2lDGNDaKqnoHlVsj2ORNQGKFZQCmUmi08RtD/RwKxaxaUmoyK
         +kgFAeGn8HKd5hXDGloBjhttf9V8dQy6fyyebm0jmW6NGAqMkMnBW+rw/xChRjZZ2TYj
         7i9ud2b9ev1EmWvqe7QeVQ3+3GicKZ0bFX+psHy/gzBMHxaSHhtzfeDcgqzQfy+dP7C+
         sYfIYd7nO4LMhnk+qzrxakqI7FSmSJZwxdq8OVgewYaZwDYfiOx2ujIVq1X94sbVkh/t
         6DEjicpPQllqIsdGFwaY7Qo+mZJ+FDZp4+X4Prpu+alnu4OLu95MbWoRtIFmrS5/WIId
         Svkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564498; x=1790169298; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayPxym0az/dPYYVwbAryo+qLlPY3Bz4ZHUPUVaRwQrk=;
        b=IpxwBWKq8usVDOA1CeKSUcyj91rqyfgLJhKh+a8DZLhNf4BSuYYkBlkQWeLrGOSnL6
         jYCmE7Ogi7Z8d+z9/RyUibodPBDW2haBCRCzPlfgVcSfdOgY3TpnwEAChXoQpYf1hPNH
         59n/HhxXblvt9W8gnFFfRbRLvgZx0vr0K8vLtw7NVfRsUfsaOtuL19daLnF9QgaCAmIa
         uttXsjUdi3O+6LSn8CkpTCE8+njhCBDdPoWGQwWR5mtWITLRDT7eibU7bOMMBfaGUWfC
         jgzn7kF3PmjNFN1mGU7YPxcrp0i96pNgEtbbGhqJwHkEfujeWu6uz050gIeg08OcIdO5
         3s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564498; x=1790169298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayPxym0az/dPYYVwbAryo+qLlPY3Bz4ZHUPUVaRwQrk=;
        b=M5M8KHwE9vDIlgpDxnrYhcIUKpt5KlzxWl3xn0HneNJytvLixYlF0QGdGGNWvkZxAV
         3Tw8eK1I/zqiFMGwNzahKuBVPWKLm3cFkXywFktMZoLsxGgSA72QXdvzRXYYULznnrna
         V2cQcFfHkwr5gr/iR0u9QfSBOddeWnv2mbquQL+n9cDYaFQQsn8IpB59YkBORBU3R/8o
         Ri8ovMwgZVMKnBQdvM3FTKkArULwthcl6IpY6wwQeebRTKBJR84NLipg32tE/bv/TgFv
         8dT/IIjMSfZ7dahztZB/oRr5fTo5kjjO+tdP5R2MGRNfsFCUBA2sro57yiDocYhPimsg
         RLAg==
X-Forwarded-Encrypted: i=1; AKwUvBw4mNmIKI+9lSbA/zLr5tGjHExABFyL5ukDlKh5+JHvefXqvWzHYnF56N2yujtyz2y0eRay4pxwiHnJTw6y@lists.linux.dev
X-Gm-Message-State: AFuF++mINL5hYov60euqVpTm+iLfT36eC8OXuW+78p61zGvhYWRVJadJ
	Z9o5lgRbsHNQ0MB2zrnjsb4MKThDuCHvE0pa7eTMaYUxSdYMCCuuxccXJwu0DiWiNCmGhVIEE+Q
	9Yx8qbjvd/YtyOi3kZ5ddIJ5i1991LAo=
X-Gm-Gg: AYBFou3IArZJHAOLiOQPeJ2HsKLTj5D4MZ3SrxXhjuCtVhkvmsrkM2KIyjH/qJTgfrL
	yUUiuSP2MQWRy70UUeRl7jDUPklM0H80UsL3f/UB6R7Ft2bexmunjif6rGDPkL8FqhzTpHLPCgJ
	rBl30II34YcTsgmy9HqcMWdRti5gRsElY+x5MZ/EYgDwEBlUvu6KOqeHRjYxyW+tlYTxHYI8iOA
	HBArmmE9FC6C4j/0YW/uIlLNc6RU8XPNiqR6phvTo1dS6F/3U/e3Hdr/ohiVW68ZwMZ8r3+FcUz
	T0SNxjn5nsgwLdRyO7EEgBhm2wq/6wsZF9Tuec6rHaSpWL8XwEzGG/3q
X-Received: by 2002:ac8:7f04:0:b0:52d:cf85:aeea with SMTP id
 d75a77b69052e-5327eeb282emr41860711cf.24.1789564497846; Wed, 16 Sep 2026
 06:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916093928.52057-1-palaomer100@gmail.com> <87ecet5xos.fsf@yellow.woof>
 <aqp4GA1q6cLKivZo@ashevche-desk.local> <CAKhZXnr0GdUrEu9vyMAWRCWyQzPM7cWQ6LRDa8fX0hnMkTN0RQ@mail.gmail.com>
 <87bj9x5pii.fsf@yellow.woof>
In-Reply-To: <87bj9x5pii.fsf@yellow.woof>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Wed, 16 Sep 2026 16:14:38 +0300
X-Gm-Features: AcwNN1Vm49ztxlf0ieuaRYYQIq3zlaRFigYw8UrkluaAB1jpWTaPVqREkoTpZDM
Message-ID: <CAKhZXnqBko0LABgLa-A6G+ztt1Y4p6yXdcnGDp7HbC3psv9WUQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with usleep_range
To: Nam Cao <namcao@linutronix.de>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, 
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nam Cao writes:
> A crucial difference is that we can call udelay() in any context, but we
> cannot call usleep_range() in atomic context. Thus, a test run with
> CONFIG_DEBUG_ATOMIC_SLEEP enabled is recommended.
> I don't know if non-deterministic delay is an issue, the datasheet would
> need to be checked. But udelay() is not deterministic either, for
> example the CPU may need to handle an external interrupt while the task
> is calling udelay().

Hi Nam,

Thank you for clarifying the atomic context restrictions and pointing out
CONFIG_DEBUG_ATOMIC_SLEEP. That makes total sense, and I now see why udelay=
()
is mandatory here to prevent potential kernel panics in atomic paths.

I am dropping this patch series. Thanks again to everyone for the valuable
feedback!

Best regards,
Omer PALA

Nam Cao <namcao@linutronix.de>, 16 Eyl 2026 =C3=87ar, 15:50 tarihinde =C5=
=9Funu yazd=C4=B1:
>
> =C3=96mer PALA <palaomer100@gmail.com> writes:
> > Thank you for the feedback and review. I note the line-length
> > formatting (~72 characters per line)
> > for my future commit messages.Second, do you understand the difference =
on what
> > code is doing before and after your change?
> > I understand that udelay() provides deterministic, busy-wait timing req=
uired for
> > hardware register initialization, whereas usleep_range() introduces sch=
eduler
> > overhead and non-deterministic delays.
> > Out of technical curiosity regarding the driver IC: theoretically, if w=
e knew
> > the exact window between the hardware lock/stabilization
> > time (min) and the internal state-machine timeout (max) from the datash=
eet,
> > would a range like usleep_range(min, max) be acceptable,
> > or does scheduler wake-up latency make it too risky for
> > timing-critical init sequences without hardware validation?
> > I will drop this patch series.
>
> A crucial difference is that we can call udelay() in any context, but we
> cannot call usleep_range() in atomic context. Thus, a test run with
> CONFIG_DEBUG_ATOMIC_SLEEP enabled is recommended.
>
> I don't know if non-deterministic delay is an issue, the datasheet would
> need to be checked. But udelay() is not deterministic either, for
> example the CPU may need to handle an external interrupt while the task
> is calling udelay().
>
> Nam
