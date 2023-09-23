Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2EAD51E
	for <linux-staging@lists.linux.dev>; Sat, 23 Sep 2023 10:33:23 +0000 (UTC)
Received: from [192.168.1.129] ([37.4.248.43]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MysFQ-1reYJ00JV4-00vvV2; Sat, 23 Sep 2023 12:19:44 +0200
Message-ID: <21893e62-2a93-af84-a004-5bebc9916627@i2se.com>
Date: Sat, 23 Sep 2023 12:19:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v2 0/4] staging: vc04: Drop custom logging
To: Umang Jain <umang.jain@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Adrien Thierry <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>
References: <20230913185528.770634-1-umang.jain@ideasonboard.com>
 <1d54715d-25f9-4937-bdff-de0136c95fe8@kadam.mountain>
 <d8395455-44eb-6762-d978-e912bf2cfe73@i2se.com>
 <3f040e44-3bdc-b09c-58b3-ea3b0ac6d5dd@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <3f040e44-3bdc-b09c-58b3-ea3b0ac6d5dd@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OFXh+SWAalxlA/BKarJEaKNh9elJf6QmZksB0h43QjpisjqGtPb
 P4dwfYkn0nxOJNRDcn+08zW0B50MOIcgT10MmI3ri06XRKELcujsGfJiJmNklFw7aTIEiqR
 O54kv1Rip8jhf20KE+df8IvZMrl8YiIldtOaqiK72Q5CQ2E6+gQeeRof4+poGtxuLrsEGhy
 fDjnHo+JYxMGWfb006x0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gbCDVVAn8+M=;ecbECLQL/394fwcugl4kF2MzbQ0
 5mkIZfowPzRCIucHiPN7iuYQl4A8EPQ8/5a146Y18SLraBcvVXQ2jjnUrUTZQK4DC5SunTUYC
 yBv7J3opLPbm0uW7ltuPJzasP2Czg4OkigfcKh88synwksRwR9Ez/tfTLatdBzzASx1ojjPX+
 0STlEPPHOccqADBq+bbaMeuMLCR5+8hM/bnaNnnzyxX35WLvsLPLCQAqcPnuwvMG+nEgJH1qs
 DgJQTkfm+WMPd4dy+CFhHONMiRZfCoQ1Ghu265aY8+n5WC5gnbStqEcbHitnCpfU740XvuCrP
 of1Vu6QrIrNwqD291GHcbLxUP0eYTHqEQQJM1rbQT5pLO8NfvEE5vK3/CpOKRIPE//Qlq63e9
 g/YrpbmV7OuLwzB9dFfyncekFDA1bpk8Ry87fuxhLDqFxLk4KfVcmdKCZDqxrhzhFkZzZThjk
 mRDVXYlydlktXWGBd6AjYAIrQYDW6SGS7IN6j1HxK/tVbUrcHCpA7I9Y8jf+mw1s7EvykWHG4
 nUC7/t301KyfPn4EB18CVpvp7Ykwy8G/9RZZmFrYITbha/zwNoja9F9UWNmRScWo4Gii0VBtE
 MlTJ25B1sGCpIahL3VEXenu0oFUiSHsVv3pqS4ol906f7b6AolUGTh62Xk7jN4MJ5Y1ZhrUeJ
 bnPEU7C5IlHZbW0TkoCg0DUtrx5WniqqMXv2upREWhp2kVPGtyZfsr5vJVwXF/hb0SIyY2uT+
 LvKqT60jEJWWCeZFJxSKqytvNTBM8mELVOl9BFia82wLG/9A2UbGVPTQY/0vKMGb6b55d3hui
 EWKzdJYi1Z4FSn8muBOIqwfNXx9UpWYp24zqnDaiSDMB2xqPc65k4HKsGK61xocQALG6t8nNU
 CJ2/rjA8INllGxg==

Hi Umang,

Am 23.09.23 um 11:39 schrieb Umang Jain:
> Hi Stefan,
> 
> On 9/17/23 9:06 PM, Stefan Wahren wrote:
>> Hi,
>>
>> Am 14.09.23 um 08:35 schrieb Dan Carpenter:
>>> On Thu, Sep 14, 2023 at 12:25:24AM +0530, Umang Jain wrote:
>>>> Hello,
>>>>
>>>> This series attempts to restart the discussion on custom logging used
>>>> in VC04. In the last feedback gathered in [1] it seems that the logging
>>>> would rather be moved to use dynamic debug. The series tries to move
>>>> in that direction.
>>>>
>>>> The elephant in the room is the ability of turning on/off log levels,
>>>> which this series just drops. Compensated by a crude strings
>>>> ("error", "warning", "info"... etc) for easier grepping.
>>>>
>>>> The log category are also just strings (which probably can be 
>>>> transformed
>>>> to dynamic debug class names moving forwards?).
>>>>
>>>> To move forwards, I would like feedback on the broader direction.
>>>> There are couple of TODOs in each of the patch (summarised in commit
>>>> messages) which require case-by-case discussion.
>>>>
>>>> Additional high-level questions to move forwards:
>>>> 1. Is loss of log levels by moving to dynamic debug, is actually a
>>>>     concern? Is dynamic debug a valid replacement?
>>>
>>> Dynamic debug is honestly going to be an improvement.  I guess, Greg and
>>> I said this back in Jan.
> 
> +1
>>>
>>>> 2. Whether debugfs should be dropped as well, found vestigial in [2]
>>>
>>> Yes. The "vchiq/log" should be removed.  Ideally as part of this
>>> patchset so it's easier to understand.
>>
>> Yes, but please do not remote vchiq_debugfs entirely. I'm working on a 
>> patch to move the state dump (debug feature) from the character device 
>> /dev/vchiq to debugfs /sys/kernel/debug/vchiq/dump_state.
> 
> Can't the state dump be printed to dev_dbg() ? Will it pollute the 
> kernel log?  Having debugfs for a single dump doesn't seem worthwhile if 
> the state dump can be incorporated to dev_dbg() too.

debugfs was created for a good reason. dev_dbg() is a nice tool, but it 
isn't useful in every situation. In case of communication the usage of 
counter is quite popular and removing this ability would make debugging 
not easier.

Try to make "cat /dev/vchiq" you will see you don't want pollute the 
kernel log with this kind of information.

Actually i don't see a problem with have a single dump in debugfs.

Let me send a draft of my changes for a better discussion ...

Regards
Stefan

>>
>>>
>>>> 3. whether vchiq_log_trace() should actually be tracing support for 
>>>> VC04
>>>
>>> That can be done later if people want.  No need to discuss it now.
> 
> Thanks Dan.
>>>
>>> regards,
>>> dan carpenter
>>>
> 
