Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF11F34A3BC
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776497388; cv=none; b=T7VTeTguTWbzUeJdL/6jS8n/8ozmkJssM2AAkEAndNNqCQKQPd1kuE7n9xruNrLhiKPAeIRsm0LoKpIc+eejk7eAUnj91Jd7tegop2SQk4NUtqsEEyz+2W3VAceWRWgqHoHvzfr+wNiPOqDLo1RwEEf+8NhmHtagdh+E9DjiqrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776497388; c=relaxed/simple;
	bh=qaGF1RRSL1bC8EYDRwEbD9+1ZercGX6XeqoOxPsRGyU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jJRLStguF3duIf/cJ+K8/m9blxQ8+9Q7HTS0jV2DQy17GCWrK7ehN7fVp5FDv0JBOEd0rnQ/w/sJNagPVakz4GwV3yZZtiPKIJDEEZyA/LzLJtLJrlcPyg4Fwl01XKtM8zo4cTbnAgBwJ5faT8XLOoSmuslskLlMoMnOxtN6d6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OD5Ap0/4; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OD5Ap0/4"
Date: Sat, 18 Apr 2026 09:29:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776497385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogELrYjbJSh3nfzr175UIjBsTa3CQ88AW3rtJsAonIA=;
	b=OD5Ap0/4cn4Dpq4IFPq0EebPDtYBaytXBTqQxTfuNzHjrgic6ajE+ZKnd5bMCu577fACYW
	ucE3NXOu2/aJsRCTClOGNHRiyL1t8wEKtFGVPZ5LkoDKaVqrY4wtcSrXjwbyiNP8xFu6Wi
	48xzhPbEjUSqEzrsAxkJ9mZYaEYgZ1M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>
CC: osdevhari@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c
In-Reply-To: <2026041859-excretion-septic-b5a5@gregkh>
References: <CA+TGEkGJ4HaZZOVSXhkb93y9gdBZZf3e0G=zajdx9sAo4iBU5w@mail.gmail.com> <F7E0CC29-4E94-4759-9E3E-689AB61201F9@linux.dev> <2026041859-excretion-septic-b5a5@gregkh>
Message-ID: <5182B112-74AC-4A7F-9D2D-79EA61B1983A@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 18, 2026 9:11:40 AM GMT+02:00, Greg KH <gregkh@linuxfoundation=2Eo=
rg> wrote:
>On Sat, Apr 18, 2026 at 08:57:08AM +0200, Luka Gejak wrote:
>> Hi Osdevhari,
>> Let's start from the top of the email=2E Firstly attachments are not=20
>> allowed, only plaintext=2E Secondly Signed-off-by tag must use your rea=
l
>> name(Firstname Lastname <email>=2E Thirdly, you should setup git=20
>> send-email and use it to send patches=2E One more thing why did you=20
>> resend same email twice?
>> Best regards,
>> Luka Gejak
>
>Luka, please do not review patches like this, it is not the correct way=
=2E
>Please do so, by not using AI results, and doing so in the in-line
>fashion, like the style of what we do=2E
>
>And there is no requirement to use git send-email=2E
>
>Your email here alone has no context at all, making it impossible to
>properly quote or respond to=2E  Please don't do that=2E
>
>thanks,
>
>greg k-h

Hi Greg,
First of all it is not an ai response, and I didn't see need for=20
quotes because I didn't actually talk about code but if prefer quotes=20
at all times just let me know=2E And I suggested git send-email because=20
it is easier for sending patches without worrying about plaintext or=20
attachments=2E Also do you know how to get quotas from mailing list to=20
my phone without manually copy pasting and adding >, since I am not by
my laptop right now and I don't know about something like lei for=20
mobile=2E Also to clarify I used such tone becouse he is a begginer if=20
that is what made you think this is ai review=2E
Best regards,
Luka Gejak
