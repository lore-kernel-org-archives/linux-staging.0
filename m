Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042701DFD2
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=i2se.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [192.168.1.129] ([37.4.248.43]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDykM-1qloNr04s0-009uH9; Thu, 19 Oct 2023 20:18:59 +0200
Message-ID: <0020ed1e-9a89-4c63-a3a2-4c506ba33865@i2se.com>
Date: Thu, 19 Oct 2023 20:18:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: vc04_services: vchiq_bus: Do not kfree device
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20231018055228.825524-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20231018055228.825524-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kqgyPwBfsY6VtDAs/5SDo8sZ3fouhuZHcA25EM0m5/w8XjakqLv
 POOScfT1NpCVKD2BvBdVsmMlxZpnbfYduwT04pKUQCTVbyIVreQ26JIb9OjlyuS/Ap94MN6
 dKT+DX8IDBxrVJjuVPk99+A03tmtZlGzXh6+eZTaudmRr+Iv0BGGRhndy3RAWyPbebOaqJ6
 +nMaQQPPVbVBGN3QWrRWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jyUi8k2PmhQ=;yUpIoZb5eUJwjJ3ofwC3Q6fjQoZ
 6abq4652UWJsg/ZxZBfGcV02JpPXgq6GyNx+/aZAgqIxKz5TxS8zySPjr7Bvh0hYVB/KeZmDS
 1/x4W4eTPG8CiYLrkPRvBTyS2ZvPG+esCiJuBNJ996f/d4ovLuSmesSf5qIlrMthweqLGVdSs
 2ncQSMsbrtefY92d+Gr8felAsO3XKpFuWDjXtCwA2h473VvDbXBd7GyO47hVry2BNauRHKYtz
 1THtqXmyng8GOlCMsBCTSqPZdMOn15+1A5U0rjMQQKHLwgbCUAu/3/tQE2n2z0dwmCsYPyWSG
 wNR+5nHfO9EPviEdvgY9WxDw5oqOB/aaWP1g9ddcEsfy4uJDSZcS9J95i4ZxSoPS/syXNElQC
 Uy1IOIcrU3UYajgzKcE3PmbIVI8K39EDZtQRsokvdklYp1lT2VOHl2IX/CH5s0BGWBMtUByVw
 DPfNVj8Ks9Cr44vOQYfx0UGMd2hFCr8VqYv49zZ/kjEhWSiadXytTVwm+GcNHQc0uho5huq1f
 O12sr2xsQW+usr3RyWNzQabANtPmuCXurDx6tU5mPfbccc0F1yYeOzQucqE56fSmSJKPV9M2y
 A8Hqsu3PiK0/wiChLuGY2V47X+/dJdrhHtB+00EvuOk5veCNQLnstjdZr2RF4p64gOySxiz6x
 3JU4egMETWclSk6uSl+A5hw9GNpqwDKHRHvIVks+BhnQNVRm2XellaoGBQpiz0mhoHTDB6ddt
 +DhEZEi/dnpSYAGTJqRk5zxEaCrZiQYy2jCulQZYMs/OEJCY66wZ/PaQBPvdDpZ9TiqeyzYH6
 P8N/G1/nTtNv9EXoXyHU2IUJp5NhOdxhuMPUmVaZMF/w+e+kT7ejmXyzv3Op4pmrRe5xTwQrb
 raS21nAPsTwtXaA==

Am 18.10.23 um 07:52 schrieb Umang Jain:
> As per device_register() documentation, this kfree() on error path will
> crash. The call to put_device() is all that is needed here to free the
> memory.
> 
> Fixes: 027e5703de6b ("staging: vc04_services: vchiq_arm: Add new bus type and device type")
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
