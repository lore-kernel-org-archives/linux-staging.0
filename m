Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E852F691D
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048513; cv=pass; b=ATo+FAvsoLnNpXdNCgdGDomNAIpJse2EQsM88mD36tOjdFhwvuBL8Yj6Wr3uqVxzBgCiH6jV7yeJckSLV3mYGnkzcVr99L2aZX8lsgP7KYUsFuhuI1JsSob1byU/G9u/+dEh2wM53CtVJgtr3GOLu//snWYb0wtzzZum6S69pjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048513; c=relaxed/simple;
	bh=9UCV3Sh+5nD+ABZ3Qtn03aGo/updz1jHkbnyUIkt7OE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=iM9yiPbGyBifzWZu+rRkYWHEWGuNBTUF9T3JoBtzgrt+U+Baha39lWTAjIdKziP5ScAtDv14vxI0lKZxL2AL3NmUD/f3IwrXmMVw7jA5LuiA5n+wC30hfW86Rc/84xEadHHcSPxQ2m7xldmjZoLC5qDCHta6DpBEM/9jECKXjm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=bUTa/j2R; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="bUTa/j2R"
ARC-Seal: i=1; a=rsa-sha256; t=1778048499; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=aa18dYpSirtbBEcVb5L5566THfy63KvuZi6AWljwXsS9daPRlcU704jTCSABPWNZ9tWCEDc6RlyIC026L/0Yc+dMXfBAXnDyAeoY0S8sWxQC9KxEQmQBdADeOd8g9tMWlwQn6KyjjOdgEsjzVBuEravtE+YQ+GgxMmHwMeS1u+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1778048499; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E40EchJDUgUbsvzbL+E6WTfnXyqjYF2qVAAT94pU4jo=; 
	b=FmpGcqpE009lel1cdNsLUicAhq8CgBZv1KmLRMbiLeLDAbo9TMZS+mC2ytjzVaw5fokNhfgRGyCMBURWVLN6oK98h5qWzCH3buv8ctA49CvL/FbpYrqRWLb3YApjLYw3Z6EfWa+UPyg9OTPXhHMbk5aA5scKX46wWlLBcC274aw=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778048499;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=E40EchJDUgUbsvzbL+E6WTfnXyqjYF2qVAAT94pU4jo=;
	b=bUTa/j2RLpgY6KLN921sZqf/cktWna4AYjlg2eo9zECAoyYx21qcjZvlBFoszai4
	7vcIyuUyIN3bJutp7Q+l+xNIcyaZWlVDHyu+ZQAGdaOfJsCtgVuBo4gEDWMRiy8J6oX
	dzq07xhLq2r44j39z1cQg3HXsriOsV1GmJj2tPE4=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1778048497310528.5887892751522; Wed, 6 May 2026 11:51:37 +0530 (IST)
Received: from  [103.164.208.221] by mail.zoho.in
	with HTTP;Wed, 6 May 2026 11:51:37 +0530 (IST)
Date: Wed, 06 May 2026 11:51:37 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-staging" <linux-staging@lists.linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19dfbf2f695.283866a26574.4001086986822756666@zohomail.in>
In-Reply-To: <2026050626-blinked-armadillo-c405@gregkh>
References: <19dfbab05a8.2d751ade4111.3028810368318669188@zohomail.in>
 <2026050614-roster-walrus-6995@gregkh>
 <85d6c003-500f-41a6-a9e1-ad83a586d694@zohomail.in> <2026050626-blinked-armadillo-c405@gregkh>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary comparison to
 true
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

On Wed, May 06, 2026 at 10:33:02AM +0530, Ashwin Gundarapu wrote:
> Remove explicit comparison to true in check_fwstate() call and
> add spacing around the bitwise OR operator to improve code style.
>
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
> v3: Fixed double --- line and corrected whitespace formatting as
> requested by Greg KH.

Changes from v1:
- v2: Resent with corrected whitespace via Thunderbird plain text mode
- v3: Fixed double --- line and corrected whitespace formatting

The original v1 was sent from Gmail web client which corrupted tabs
to spaces. v2 attempted Thunderbird plain text. v3 fixes the double
--- separator and uses Zoho webmail plain text which preserved tabs.


From: gregkh <gregkh@linuxfoundation.org>
To: "Ashwin Gundarapu"<linuxuser509@zohomail.in>
Date: Wed, 06 May 2026 10:55:34 +0530
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary comparison to true

 > On Wed, May 06, 2026 at 10:42:52AM +0530, Ashwin Gundarapu wrote: 
 >  
 > <snip> 
 >  
 > For some reason you sent this only to me, which is a bit rude to 
 > everyone else on the mailing list.  I'll be glad to respond if you 
 > resend it to everyone. 
 >  
 > thanks, 
 >  
 > greg k-h 
 > 

