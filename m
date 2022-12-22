Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509328F0
	for <linux-staging@lists.linux.dev>; Thu, 22 Dec 2022 11:08:27 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MacjC-1obzTr3ClG-00c7RZ; Thu, 22 Dec 2022 12:07:57 +0100
Message-ID: <8fcbdf54-98ae-6a06-ecaf-591a43b863a1@i2se.com>
Date: Thu, 22 Dec 2022 12:07:56 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/7] vc04_services: vchiq_arm: Drop VCHIQ_RETRY usage
 on disconnect
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry
 <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221219115725.11992-1-umang.jain@ideasonboard.com>
 <20221219115725.11992-6-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20221219115725.11992-6-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ow/FZUP+RKjclWSiCtRIaLt7Bf7HqGbYjZOp9iWu0B/tP44u6ME
 OX1XZE9IOt7yjDKIPhox6tUfd0mvsbzBdeWXUEW/FbnRnRxlJfokQTdRyRkQzuZ1AD4HeWJ
 K58g7bsv6D8irvrrvSRSKMg3qyUYEfgfm6oNVudouzpxtRouV+smCpSQNQY7H+oYTgUAtiR
 RrZiVOK9YBcABgjeNjUeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NIzVU/U6y2I=;ntISWqAzkY8Sol7nfKIpq0ArtHF
 OEAUdqhoO0+ln1uLQUUV3BATXP8NI6raoZsgxFYp+8KNkADoltuBDozq3eKQeXkUlBW2qC5VU
 uB3oCBgUsGDG2O3HwXYGuGBRmIRnyAkWaJxIZSS/ymtzKC/qCzQ3XXc8TqtIQekj/S64/hQzu
 54/yrdQaUV6bF8mqgLii3khsYhTNvDwFeb1ByMP1+E9lodGgwGThuSkOFgYQPcS663BranzzU
 Ep1tPlUdS6xSto7F8EIB06WCxFtawf8Nx/r25qHt+UYvPBlnUhpnYOqYlQNeta95tPcHujcSM
 H5VbOCuLb9CypWEwWD+tRTOXjCHmSRb8tvVrw4QIcYabNQl8MjhmH0CCRP6EGc2zKhCZSklQ2
 M0sGAYJrM76ib/yynCXJETnVXdxbsb7ig2fre1JITN1VZ5C4faTIiGIiY+98WU3cjxTKcQ0tE
 YBjrV+UJhFzuIya03PSxLZ7frSZ+M5Xj/mmbVB2xXSRZOUhVbSLWBKiMzkK6e6kG79bDJCZ90
 qG9rS/oIHZ2P0Vlt7QQdLHgnwRY7NCvDS9wH1v3s9o1JVUV/Vwh6MQZMgfKPWaKFNdwQWokCj
 G9Mb3NuCb+FoCBmjqP6kDso00Hjxa+k2buzqwOTCaEeG+3yWfoDKk0zNssHgXWdE9WHhcTYGw
 zg5RMBsY2e4q2EhQXd9BHVpIBxyXASfZurv9QlOwWw==

Hi Umang,

Am 19.12.22 um 12:57 schrieb Umang Jain:
> Drop the usage of VCHIQ_RETRY when the vchiq has connection status
> VCHIQ_CONNSTATE_DISCONNECTED. Disconnected status will not be valid to
> carry on a retry, replace the VCHIQ_RETRY with -ENOTCONN.
>
> This patch removes the usage of vCHIQ_RETRY completely and act as
> intermediatory to address the TODO item:
> 	* Get rid of custom function return values
> for vc04_services/interface.
>
> Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
please drop this fixes tag since this commit doesn't fix a real issue 
and also shouldn't be applied to stable.
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 9c64d5de810e..ddb6d0f4daed 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -3641,7 +3641,7 @@ vchiq_loud_error_footer(void)
>   int vchiq_send_remote_use(struct vchiq_state *state)
>   {
>   	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
> -		return VCHIQ_RETRY;
> +		return -ENOTCONN;
>   
>   	return queue_message(state, NULL, MAKE_REMOTE_USE, NULL, NULL, 0, 0);
>   }
> @@ -3649,7 +3649,7 @@ int vchiq_send_remote_use(struct vchiq_state *state)
>   int vchiq_send_remote_use_active(struct vchiq_state *state)
>   {
>   	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
> -		return VCHIQ_RETRY;
> +		return -ENOTCONN;
>   
>   	return queue_message(state, NULL, MAKE_REMOTE_USE_ACTIVE,
>   			     NULL, NULL, 0, 0);
