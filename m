Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220FA29CA
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 15:24:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1643124277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ToJg3jSA1hb22IdmSrDZMdYzlPyZ7gmRAsbq3s775aFW7Jqx4uWE4LXYzuzZ258oFOWu/ljIlDhSiaSsEv7RYKD9/f6AfJBHjjImkXIoEU0IBZvy3X/TqWHLuEXGmTrieN1RC8Xuo4p/fZ/b6JLjnNPpLLcQHQXf43kTt69u0k8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643124277; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=hoEPF5yksD4wpAozpHpJgJOpvHYwFGIgP8wZwqt0U7E=; 
	b=d9lY36P0VGyN8lZ44e1S6rPpiqYH46fGKJ1tM7TvPx9YndM1yK598CrGX8ogO3uI+hsm3MSe3uIZEBHfV/5nJuwwx8DPFqqykvOTy9vbFFYkiR1uBd5IfBu2w6mn1ClAOA4lxMkDG7BaTmXHupe2TdvoWozjMc5uEQ5bLaBxS5I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643124277;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hoEPF5yksD4wpAozpHpJgJOpvHYwFGIgP8wZwqt0U7E=;
	b=fWiWN9nSBWMj1FquKoX19p9SwwhbELzgVtvPjbmhKeHnhyu42dOpN5HSHlutJl+v
	QCPKcNlF85Lh5NaxEUD3023zuuCwNszBXjo7AFm/hDiIhzFeerVwmu2ZMYxeL7aZB+5
	SWGNYJIKoYMyPD3oBh0YF+kLEFnQNb3vLhinsW10=
Received: from [10.10.10.216] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1643124275882291.2786235973862; Tue, 25 Jan 2022 07:24:35 -0800 (PST)
Message-ID: <a4506b38-4ec8-d192-8579-79132c25969a@arinc9.com>
Date: Tue, 25 Jan 2022 18:24:28 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re:
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-staging@lists.linux.dev
References: <20220124124351.4604-1-arinc.unal@arinc9.com>
 <CAMhs-H9qkd-uy75d=NPLc5Azt3ejyW5zstpq75=i-e8iR4Xaow@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H9qkd-uy75d=NPLc5Azt3ejyW5zstpq75=i-e8iR4Xaow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hey Sergio,

On 25/01/2022 17:03, Sergio Paracuellos wrote:
> Hi Arinc!
> 
> On Mon, Jan 24, 2022 at 1:45 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> Hey everyone,
>>
>> In preperation to mainline mt7621-dts; fix formatting, dtc warning on
>> switch0@0 node and pinctrl properties for ethernet node on the mt7621.dtsi.
>> Move the GB-PC2 specific external phy configuration on the main dtsi to
>> GB-PC2's devicetree, gbpc2.dts.
>>
>> Now that pinctrl properties are properly defined on the ethernet node,
>> GMAC1 will start working.
>>
>> Traffic flow on GMAC1 was tested on a mt7621a board with these modes:
>> External phy <-> GMAC1
>> PHY 0/4 <-> GMAC1
>>
>> Cheers.
>> Arınç
> 
> Nitpick: next time try to put also a subject like "staging:
> mt7621-dts: cleanups (or whatever)" in the cover letter of the series.

I had already sent v2 with that. I'll send v3 with your input on the 
series, thanks!

> 
>>
>> [0]: https://lore.kernel.org/netdev/83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com/T/
>>
>> Arınç ÜNAL (4):
>>        staging: mt7621-dts: fix formatting
>>        staging: mt7621-dts: fix switch0@0 warnings
>>        staging: mt7621-dts: use trgmii on gmac0 and enable flow control on port@6
>>        staging: mt7621-dts: fix pinctrl properties for ethernet
>>
>>   drivers/staging/mt7621-dts/gbpc2.dts   | 16 +++++++++++-----
>>   drivers/staging/mt7621-dts/mt7621.dtsi | 32 ++++++++++++++++----------------
>>   2 files changed, 27 insertions(+), 21 deletions(-)
>>
>>
> 
> Thanks for doing this!
> 
> Best regards,
>      Sergio Paracuellos
