Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB42F27
	for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 15:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1645974717; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nV4iaTnnvpNc7PtC0MnqVenc3lQhsQvmaio9rrlBeentOmB9NHWVlQXhD2VGn4EfgHVljhFYfi7lFTW7RIO9nobtw3zGSHKabZBlzrZqeOJi/6Om3CFsZYoLO5PE5kU/J+lxxj9jZrXXiqsMd05cTrTpTnLyinbVhonMRMJGVTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1645974717; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=I4NQmzBtREcNgL5/fnT5i7GS8AdZB3LKR/5ikzLkArs=; 
	b=lUam9RDuvmvblmgbgVabLpaZI7owCx63BM+uEAaab3LA8dw7ULJcOakOI6dXH7VPPr7pjv44wBLbZr9yCHV9X5DmvLzRB1ad7HqefSQGtZRrPUOqnwNwdvahJcVvZYtbdVH9voRYh/VPjx60irCqTNqMvn/XdMPVVSYG3fI14HI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1645974717;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To;
	bh=I4NQmzBtREcNgL5/fnT5i7GS8AdZB3LKR/5ikzLkArs=;
	b=M8617oZhJ9f7ocNG+Pn+Xn9Kw86MtWzb2o9NQOqDLlPI3EbK6kQB1+AgJszh7L5K
	ySsRBNtnUk/MrJPdBr9Ic5/bpq73BjBAVaUZ2MDSJN/llk1skYLfsPxuC5lm0b4K/2Z
	PEPX4dcfSXg+wyM42+dnBO0JN96n21gE7TspVurA=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1645974715489882.1322631445697; Sun, 27 Feb 2022 07:11:55 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------9IqAb4f2oDlflR0JI1iqn10x"
Message-ID: <bffc9641-ec69-f88e-b877-65d12305b928@arinc9.com>
Date: Sun, 27 Feb 2022 18:11:45 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Sander Vanheule <sander@svanheule.net>, NeilBrown <neil@brown.name>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
References: <20220215081725.3463-1-arinc.unal@arinc9.com>
 <20220215081725.3463-2-arinc.unal@arinc9.com>
 <CAMhs-H-74bK3m975Dtmg2zPrGjmqzSd+Tb_qdUV14yJBAWRQbw@mail.gmail.com>
 <d9240058-68b4-cbd6-54b0-18f41ee5a98a@arinc9.com>
 <CAMhs-H_MvXOOmUDq97YyW7uaSfeNWcKE7F+J4182=MwH7yaOaw@mail.gmail.com>
 <6902e0b3-5bd3-185b-26f8-eab2e37f29cb@arinc9.com>
 <CAMhs-H-bMgsssuy-Rrygr0PCVkgDWDi=-=3vDVG_cnMX4L9vOA@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H-bMgsssuy-Rrygr0PCVkgDWDi=-=3vDVG_cnMX4L9vOA@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is a multi-part message in MIME format.
--------------9IqAb4f2oDlflR0JI1iqn10x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/02/2022 18:16, Sergio Paracuellos wrote:
> Hi Arinc,
> 
> On Tue, Feb 15, 2022 at 3:11 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> On 15/02/2022 12:09, Sergio Paracuellos wrote:
>>> Hi Arinc,
>>>
>>> On Tue, Feb 15, 2022 at 9:50 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>
>>>> Hey Sergio,
>>>>
>>>> On 15/02/2022 11:35, Sergio Paracuellos wrote:
>>>>> Hi Arinc,
>>>>>
>>>>> On Tue, Feb 15, 2022 at 9:18 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>>>>>
>>>>>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, the
>>>>>> rgmii2 bus cannot be used on this device.
>>>>>> Overwrite pinctrl-0 property under the ethernet node without rgmii2_pins on
>>>>>> the GB-PC1 devicetree.
>>>>>>
>>>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>> ---
>>>>>>     drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
>>>>>>     1 file changed, 4 insertions(+)
>>>>>
>>>>> No issues in GB-PC1. So:
>>>>>
>>>>> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>>>
>>>> Thanks for testing it so quickly!
>>>>
>>>> I was wondering if you got pinctrl errors on the bootlog before applying
>>>> this patch series.
>>>>
>>>> rgmii2 pin group is given gpio function so calling it from ethernet node
>>>> would cause this on my TP-Link RE650 v1 which also uses the rgmii2_pins
>>>> as GPIO.
>>>>
>>>> [    1.177349] rt2880-pinmux pinctrl: pin io22 already requested by
>>>> pinctrl; cannot claim for 1e100000.ethernet
>>>> [    1.196966] rt2880-pinmux pinctrl: pin-22 (1e100000.ethernet) status -22
>>>> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22 (io22)
>>>> from group rgmii2  on device rt2880-pinmux
>>>> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying setting,
>>>> reverse things back
>>>> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed with error -22
>>>
>>> No, I was not getting any kind of error since when I test your last
>>> patch series I was not experimenting any kind of regression. I don't
>>> have any issues now also with your new patch series. Your new changes
>>> make sense since as you have said "rgmii2" pins are requested as GPIO
>>> but it seems are not really being requested? I don't have time to
>>> check the datasheet now but will try to get time to see what is
>>> happening there.
>>
>> I think this must have something to do with pinctrl on newer kernels as
>> the TP-Link RE650 that I tested uses the OpenWrt master branch (Linux 5.10).
> 
> I think is this commit which I did according to a review after moving
> the driver from staging into 'drivers/pincrtl/ralink':
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/drivers/pinctrl/ralink?h=staging-next&id=8a55d64c3336fc2ffd488a37d08ceab154c7b56b
> 
> You can also check other changes from where the driver was moved:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/drivers/pinctrl/ralink?h=staging-next

I realised current mt7621.dtsi does not apply the functions we specify 
for the pin groups on device-specific devicetrees. I believe we need to 
add this like on OpenWrt's mt7621.dtsi.

https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/dts/mt7621.dtsi#L249-L253

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/drivers/staging/mt7621-dts/mt7621.dtsi?h=staging-testing#n153

Can you apply the patch below to see if you get the error like above?
I also put it in attachments in case of space characters replacing tab 
on the mail.

Arınç

---
diff --git a/drivers/staging/mt7621-dts/gbpc1.dts 
b/drivers/staging/mt7621-dts/gbpc1.dts
index 1b5175e6ccf3..e38a083811e5 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -114,10 +114,6 @@ default_gpio: gpio {
  	};
  };

-&ethernet {
-	pinctrl-0 = <&mdio_pins>, <&rgmii1_pins>;
-};
-
  &switch0 {
  	ports {
  		port@0 {
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi 
b/drivers/staging/mt7621-dts/mt7621.dtsi
index 4da20da243e6..8e181d6f70ae 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -152,6 +152,11 @@ spi0: spi@b00 {

  	pinctrl: pinctrl {
  		compatible = "ralink,rt2880-pinmux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinctrl0 {
+		};

  		i2c_pins: i2c0-pins {
  			pinmux {
--------------9IqAb4f2oDlflR0JI1iqn10x
Content-Type: text/plain; charset=UTF-8; name="test.patch"
Content-Disposition: attachment; filename="test.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tdDc2MjEtZHRzL2dicGMxLmR0cyBiL2Ry
aXZlcnMvc3RhZ2luZy9tdDc2MjEtZHRzL2dicGMxLmR0cwppbmRleCAxYjUxNzVlNmNjZjMu
LmUzOGEwODM4MTFlNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL210NzYyMS1kdHMv
Z2JwYzEuZHRzCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9tdDc2MjEtZHRzL2dicGMxLmR0cwpA
QCAtMTE0LDEwICsxMTQsNiBAQCBkZWZhdWx0X2dwaW86IGdwaW8gewogCX07CiB9OwogCi0m
ZXRoZXJuZXQgewotCXBpbmN0cmwtMCA9IDwmbWRpb19waW5zPiwgPCZyZ21paTFfcGlucz47
Ci19OwotCiAmc3dpdGNoMCB7CiAJcG9ydHMgewogCQlwb3J0QDAgewpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zdGFnaW5nL210NzYyMS1kdHMvbXQ3NjIxLmR0c2kgYi9kcml2ZXJzL3N0YWdp
bmcvbXQ3NjIxLWR0cy9tdDc2MjEuZHRzaQppbmRleCA0ZGEyMGRhMjQzZTYuLjhlMTgxZDZm
NzBhZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL210NzYyMS1kdHMvbXQ3NjIxLmR0
c2kKKysrIGIvZHJpdmVycy9zdGFnaW5nL210NzYyMS1kdHMvbXQ3NjIxLmR0c2kKQEAgLTE1
Miw2ICsxNTIsMTEgQEAgc3BpMDogc3BpQGIwMCB7CiAKIAlwaW5jdHJsOiBwaW5jdHJsIHsK
IAkJY29tcGF0aWJsZSA9ICJyYWxpbmsscnQyODgwLXBpbm11eCI7CisJCXBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7CisJCXBpbmN0cmwtMCA9IDwmc3RhdGVfZGVmYXVsdD47CisKKwkJ
c3RhdGVfZGVmYXVsdDogcGluY3RybDAgeworCQl9OwogCiAJCWkyY19waW5zOiBpMmMwLXBp
bnMgewogCQkJcGlubXV4IHsK

--------------9IqAb4f2oDlflR0JI1iqn10x--
