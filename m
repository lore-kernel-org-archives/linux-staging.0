Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAB62F25
	for <linux-staging@lists.linux.dev>; Sat, 26 Mar 2022 09:10:06 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.126]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mhl8Y-1o2gGc2cbI-00dlml; Sat, 26 Mar 2022 10:04:14 +0100
Message-ID: <d20fd8f2-c47a-2f3e-4efa-be705f1517b9@i2se.com>
Date: Sat, 26 Mar 2022 10:04:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/2] Add support for bcm2711 in vchiq_arm
Content-Language: en-US
To: Adrien Thierry <athierry@redhat.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gaston Gonzalez <gascoar@gmail.com>, Ojaswin Mujoo <ojaswin98@gmail.com>,
 linux-staging@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
References: <20220324172647.167617-1-athierry@redhat.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220324172647.167617-1-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:MF0J0jzDKrDVpVSeRs+yL5+DPjsuUuOKN6ic8X9ZRn9nO5noxHE
 pkVO2sNitXCFmRHUYlBBUZ1tQN3NKo0K433u9l4QCIRYICQwOtKUy4GWlj/riTRa0PTSVdE
 tbIw+2vzeG0sgDVscEhHT0arSZ+SaGUcpV8UnfRX2uCI2h5Pff0VKrPgwFoimW8T16j6S+k
 QX4wZ8bO1NS22VMOx5AbA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HEgWnirrg4c=:3saXw4EW8o512aWrybj/9T
 KjgNRs5DiSoyu0hWIWFdz5/+Z2E92S1HW/hHL+VANr3i05qW1rK0OA8ROtzGPu3Oi6uTqLmqC
 IBb7RtW84LC1TEE4tl2S149yrecRzRjK/TWr60Sk3Ni9qXMKBvtGXF2GgMrBS2q3CLC/U6dWZ
 FIvwFNXNR+CFAZnf/7WIJXThY7iU+qHy3bU+gWfNmqY7Piv/y0NqkpqJO3A4qrMsw4mkkE2VU
 hCQvTzpG7ncsWe3qhlqh50zqd/HsmfIJpAc+najovC1mZ5936Yc+fY/+KSs6hIbjfsu9ndu2x
 MW+4/FRQLHVyq27txuiScBk9P3vBWRqS+g4ItwIj/91Su/n2kFMkE3MZnx+SiVv/K7hEItOLg
 rtB6acB4fZcfk1ev+Mj94+D+ttBeCe9QosC/0NI124Ghb9e66SCQMnsBiqVoD82xsShVgYPfk
 +BfYso6yBsKZ15hc9lhGKxjnlf0asf7+AkEmS8tPQybJPUge/oqY+EGR3mj7NhclbFK/H2h+U
 jmIp/lX8m2JKYQ+VIl9xIiF7aaTdz2kwHUGecd3aMk4wZw6I8Dp1gYF6SWnOvTFYChNZcZCen
 WpshipbA0bTgHq5erWMq8A6W5AjNfxABBNbDqubcLjBRBP+i6eUs/JNGXCI0H6gdWkZP43Odu
 Uvp0KX85dmbS7S/PSTmNqopNLXjkdYe9NKUlUSFiE48y2BjifYq+fmKxh1VASlWrExMgwRnFQ
 ALH4D9w6zj60YvS9

Hi Adrien,

Am 24.03.22 um 18:26 schrieb Adrien Thierry:
> The goal of this patch series is to use the bcm2711 compatible string in
> vchiq_arm for the Raspberry Pi 4.

there was already a patch series to enable VCHIQ on BCM2711, which 
wasn't accepted:

https://lore.kernel.org/linux-arm-kernel/20211014223230.451659-1-mguma@redhat.com/T/

Could you please explain your approach, especially leaving out 36 bit 
DMA support?

>   This allows using the downstream device
> tree with the upstream kernel.

This is a really bad idea and caused a lot of trouble in the past. A lot 
of the issues in the Fedora or Arch Linux forums or mailing lists 
results from this idea. It wastes the time of the kernel developer since 
these DT files has never been reviewed by the devicetree maintainers.

Best regards

>
> ---
> Changes since v1:
> - Removed duplicate compatible string for bcm2711 in
>    brcm,bcm2835-vchiq.yaml
>
> Adrien Thierry (2):
>    dt-bindings: soc: bcm: bcm2835-vchiq: Add support for bcm2711
>    staging: vchiq_arm: Use bcm2711 compatible string for bcm2711-based
>      RPi
>
>   .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml      | 5 +++++
>   arch/arm/boot/dts/bcm2711-rpi.dtsi                           | 1 +
>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 +++++
>   3 files changed, 11 insertions(+)
>
>
> base-commit: ed4643521e6af8ab8ed1e467630a85884d2696cf
