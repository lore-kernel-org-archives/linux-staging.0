Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED95264637
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827569; cv=none; b=Pz68gTNw2srbAmRwhYnVYeoYLmUaq1IgZWk3JEb6vMagK9sYZfIZ8CNYw+oZhAtwFaRgRgrsWPz1XwTKwrMb8t2+QxhtlbcTqAObn5EBLbvj6y99/gOUuWVqNCaBdT0qYWDvr53EdwpTSIL8/N7tzFJZ/uBrX+n3NAH7hU9U39U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827569; c=relaxed/simple;
	bh=4f5o0Hc8eWCghbV3LrPKLtGa6awNbZyDvDsMmi/AAU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzoxcM5mKBlFIjGKvGHd3gp/BGTANpVZCI5UxXHMU2aIwB7NaJEiLqTFxiFITbluSqggOnNWe9rLqzTWyRchfsaOtl5XYptnUCPWim5c/u+QNKA2OHmODg9W8597Gcnbl3eXaAyyd5/pU5G0SjoPvK/jGj67yRJZdaK161cbGIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=OHUu0lf0; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="OHUu0lf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747827556; x=1748432356; i=wahrenst@gmx.net;
	bh=HSCGNsAea0sFvj0YH/gFhv0ZPQP9Aw1TLeKNiDK6m1c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OHUu0lf0erJ11U1/0U8V1Alj0knTk+iVNzNAeDP4vpi5z7PQcx3EYGtYvNI9sRIj
	 nixUA840d4KCZ3M5chXwSX5iFwprjhSDW89wX3QCrzc0hPpHfKkadryhgwxNLzzrA
	 nBOwtn4Eup4pWm1crr6LewkELc7BW/wQr57g596dSfLpWsWxFTNP5n8e9WKzWEJr8
	 Q9evDKS+T53vZK15InrKkpkHtTGQks5GfJEt+gpWLfJACpSvFkGd2IVGTFJ3jZaUC
	 qqrRmNu6sy5ZJrILrBUJvhhjaKRlrsAAzakS4J7u7YssiC8l9Tp3J//NVGmwKrwnJ
	 5/QmuPqIF4mVpKcaFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1ufAy53l0A-00lSNH; Wed, 21
 May 2025 13:39:15 +0200
Message-ID: <4cac2c68-a975-4b68-92c4-91e90ffe8041@gmx.net>
Date: Wed, 21 May 2025 13:39:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character
 device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Phil Elwell <phil@raspberrypi.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
 linux-staging@lists.linux.dev
References: <20250509221152.13564-1-wahrenst@gmx.net>
 <20250509221152.13564-3-wahrenst@gmx.net>
 <2025052121-glisten-serpent-8ede@gregkh>
 <20250521112815.GA25453@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250521112815.GA25453@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E7r1vufdBFE8fkyK1CBVwKq8nBkJPz7dj0PxaO4EwaFtu9WwnSR
 PaEtzXUSMpMWtz4OXuQB870EoUISN9W0SiR1ioAjRBT+TW5tywa0lS8WPF2Hh4o+i+Ch9qP
 fKCJvknCY7lyKtB6kQ8srz3h6cBFd2KANCyzTF881ArZ81Dtlj2mDsl4pELdeGul1djFdHn
 f2QJAtggO0kVIN7Ir3Csg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1jTvT+Usbh4=;iXMANhdcmbixOJonsOG3t+Lb54y
 HsylsfXMI2o2lKlr+SlBDj9+rsF84ncwuq+gatYKJwMZ0nLz+cf9I+P+uxoItf/FMI4qcz419
 DkadJl/I93n4JBrTF/nISYEiuFlZdyDRzPnwsK9li4LyWpcXhX6/GEo8Cx0O9YeDtOW+lF8bn
 3gIQmBOft7kVVBSK0SaZLcOroIES92EOLisCEND008SLcYRdVo7dd+u3sNuWlDDz7XgE+Ts3d
 GQc4Hfmledvaz6gIfdlYGRrxXzTyy3jt6TVXojRjIDrAGusqxvSOqN13l9Ox2i0XLUXFsIqEI
 Kvz+9VPM4XZirYqQZCaqGimycG0J5ghIiEAPKEGgD0h/w04fqzUgKUkhaYsIgl9rQDaGBKBtZ
 GSxopXdAVPbtiuXaxVCX2D4c/NKId2dWTrU27ekP0NDBhlaE8zI8lSN8CFGjjpF+A1Rc7nFto
 yECmD0DuCGxtMFWrY45oL4JODci5VAp0DEBP3LFb3ikSo+ihpcGlADbXkqx6tauDRo0booLQl
 AGpSOIBL6PsdSmENKTgrI5nko0ALFEKVMpvi4ihcHQdeeuDEp0T5zHUK1eOEfP/5ckTnIJ+0j
 Vm+UPDBmoDix59XZgTdZ2+Dl3F+TCDnCtSTlY9gXWqoQm2BzsmXNeGAbmzcsthYYv03OVRq5y
 xxtA67UmGovjIeMXqYKtvKiQIPQxS6zMPfwRrdFjB7Esdmh7tQNDbFwYANdExoBv/kUKjSYhj
 nRel1kaMUj/iF1DrOgFIhOFsFMoXEWbw+h9jsmqYynVBH9OccqlWQqEFIKekX0V421maHALf2
 yV5lRn5iDzeZcdC5ZEizSzZFLxF1EE3+nbVY8yuKjyVWf3R/1SVmnmmV8jD6uJNF72vKRbNG4
 SjTPkqBmM79WjXIxMDH/E94wmSoxqDmpT/vCKnVuyhPXR/xn43LkZqDcwzD89KFOcfl3IBoUG
 OgUubjIk+TZgVFVEna9CQQvzGS0bTEG6OishnkFsiarRmfurnrl9bwFWCcyFRB/XdwI2Zfxdd
 ceP+aqnbidBeQSvDnNb0bI03selad5FIPJa3o8JvHKjjnvZLEV0+umTrkMupGQ1Aw7m23rpvg
 SE+KvN3n4r3giWoLIm+8EibDVH68eyhy9TQh0NVJyEYoFrx3Hwv/p+Vbc0CoroqRiPilknqOz
 wwoR2jVt2O+tXfXE68bXZ/UwJl05AYPzESyD4J/4JQ22t4uiLtnNrIkBKZxpBe0l1Q57MP5tw
 iUzLuUcEBpoMHxCE4U3aJypQy9dziEGthuuYPB01b7vrCt11fV0TZt/OPULHj/R5EPXIgjaFH
 1w9iJSfyyt+9TA9/WlEI4HV+0qua3A1+udqyk/Z8xwESodlmvFX7wTcgakZncMO9Te5LHa8Dp
 LgX5zaJkCeMaaCC+JNcXUpP3vIOGYdKTCsgQEQyRB/WB60LHSJy5H6hnFyHH9OzcDmkBUMnOL
 k0P6HJG/fEKj6ypcOOM0yAQ1B0AbDA/tORGJI2oNbMlBWqbEsr+4FkL3845Ia+zvWbWvItAzw
 yrn8yRS9VNmkVXyysjhubyN2Q4o+PuTlwF8VFDiKXgGeeUk5mflJi33sQwmuBTrxpUZ1jdzZq
 5F14OMzxLNlH0dKvA8ee/9zExmycxogDt0R/1Hw08Pn6wmOLVgTRGQmWeVL+JlHnTDJkMUo3D
 0HPufbKnLocEHDP3nOA0FqUJQ8Ux73djzf2Q7tFY0gAe0MGk1v6LZ5gfsGcddR+gWphT7355H
 fXdpPRWIPOgJrHheF29NCR9rU5TIpq0yohjxGCWWepvtmkQc5bJx1z4LplRQb3efFLnWaHCBg
 q85exCszPOnlLiBSTftE+nzILvw1rnsQ1OFqPQqHRSSKwhrAbSCF8z+MJdb9sgdXDuBHX3or+
 yJPPaYzFdoL1s0PIzrw5S67Pvh8WHV9CAtQLAd8RummSIR7aHjHmKZKmppVcbzTVeFnjEHV/B
 gFV6S2aKC8mjrRcsft5HVwwwRStX4FzvMzeOSCVdnzp0w0EE/gBIxRGb3NykZmq8SJJfUft4V
 DevrvEv/m6TKjdr0UY4GujSGF/wZZXut0oSF2DV+YBKb7pDQSiTbz+uAGazTRWbZHWPUWkT64
 sCMh6Fr37DLeVUsk0YTcbzUEFM5FS/rvfWYvhS538zyBntNaX7Yt83CMmyrJBUB9N0XVp+Xlz
 zDrOPHF6H7Q4M8ttkgAul44I09OHU2fogDfp4zHRMJcuI5Rv2hHV2Hu5pERkFJd8PFUIBYrLh
 hELToKD4d6uMfiLjEE6GSOplZTtsFwweklwidtFtTJJ8aUoz7DYLn5xvV+10Z51PJkbv9c4LC
 2gwn9pXublIK142Dm4LYViW9SDUL1+eR0oecG3TbxTXzulKDS2nALBGgOTy6Rzb0eDqjSGffS
 BQpBtgumapGg6I3V9c8Qr395QSLHzY4i/jjkTua0+pfLGpZwSZ339xJPaWWjSZ0B+w20g2MvN
 b4hFrzVfg34s6hozSUrRYSQVDLWwJV0TEk+aR2U+wDU/78zFuhYKIPtaUhGzag1Pqbvy2pjGF
 52Lg7+WH7gR2u/QcL80LpWGOgtiQCuL3wjhXrrgxDGWGNLM4qiK2YZFZMPZYLde5O3wbLDBhN
 bAbrEFOEP9stDQNoAdyEXfvMywR8iGBdwoY97KEQ5WpIi+xBdmLCXIFn43MDg+NIXxS7psCuB
 ji46sVQ9suH89g7kORWRkgMcfMgrl2SqY0Y0VXPofGAxKLBBgPc8Y0HsRubsE424P85d5yvRK
 BJUP8wOxVNhdGZnHM/63DwH26bW9r3EGcH8iVsySnsdPmiGafprQ9ANX1hNfHyNjPvy+ciDqU
 JaglQEuEKIjdx92HAZJZ2W5etbz52lbZljT+IDFiHe2++XAQGg2CN8o7pH2bXMrifEnqYofcO
 4dEnl3HC7ZWbFpVHLBn1IQr0wscav7Jp3HlAnaPUVraD/j56cU5cUps88obFvB9+rD8xXjt4M
 WMf0wQ5OlkETBhAY/XyxHkJRCMnaWXCj/W5BuHA8bEt9urlZ9jsTr5DpkOkwWYbNqJ+WA9dKC
 ElYQSfDvXndMNB2vlIrWP5yL38VjHMc0ctgwhPP7d+o+eYQbLwkYlu8fmi9BDkREQGm0wqP9k
 DvU62H9BG+qtcL7sQN2x1QChoYbSe9yzpduUsVha+MIh1TOTyl4dqKICE0hmBDEoo/cWVJZmt
 K89M9kwqwj0NpxkLjbnxN1+qY

Hi,

Am 21.05.25 um 13:28 schrieb Laurent Pinchart:
> On Wed, May 21, 2025 at 01:20:54PM +0200, Greg KH wrote:
>> On Sat, May 10, 2025 at 12:11:52AM +0200, Stefan Wahren wrote:
>>> From: Phil Elwell <phil@raspberrypi.com>
>>>
>>> Document the IOCTLs for the VCHIQ character device, which provide
>>> a userspace interface to access the VideoCore VPU of the
>>> Raspberry Pi. Several ARM side libraries make use of it like EGL,
>>> MMAL and OpenMAX.
>>>
>>> Link: https://github.com/raspberrypi/linux/pull/6801
>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>> [wahrenst@gmx.net: Rewrite commit log]
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>>>   .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++=
++
>>>   1 file changed, 87 insertions(+)
>>>   create mode 100644 drivers/staging/vc04_services/Documentation/vchiq=
-cdev
>>>
>>> diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/=
drivers/staging/vc04_services/Documentation/vchiq-cdev
>>> new file mode 100644
>>> index 000000000000..99ab2567643e
>>> --- /dev/null
>>> +++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
>>> @@ -0,0 +1,87 @@
>>> +What:		/dev/vchiq
>>> +Date:		October 2016
>>> +KernelVersion:	4.9
>>> +Contact:	kernel-list@raspberrypi.com
>>> +Description:
>>> +		The ioctl interface for the VCHIQ character device.
>>> +		Following actions are supported:
>>> +
>>> +		* VCHIQ_IOC_CONNECT:
>>> +		  Establish/confirm the link to the VPU peer.
>> I understand the need, but this does not document the parameters to the
>> ioctls, so it's not all that useful.  How about just a normal
>> documentation file with this all written out?
> That would be my preference too, somewhere in
> Documentation/userspace-api/.
>
could you please point me to a comparable IOCTL documenation to better=20
understand your expectations?
